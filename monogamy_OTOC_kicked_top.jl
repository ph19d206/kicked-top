# Three kicked tops are coupled. The couplings are between 1 & 2 and 2 & 3.
#This programme will calculate the OTOC with time between 1 & 2 and 2 & 3.

using QuantumOptics
using SparseArrays
using LinearAlgebra
using NPZ
println("required pkg are loaded.")

#------------------------------------------------
# Parameters
j1 = 8
j2 = j1
j3 = 15
k1 = 5;
k2 = k1;
k3 = 5;
kicks = 75 #decide the evolution time.
Δ12 = 0.7; Δ23 = 1 # coupling strength.
α = π/2
#------------------------------------------------


# Basis
b1 = SpinBasis(j1)
b2 = SpinBasis(j2)
b3 = SpinBasis(j3)

# Operator creation
Jy1 = 0.5*sigmay(b1)
Jz1 = 0.5*sigmaz(b1)

Jy2 = 0.5*sigmay(b2)
Jz2 = 0.5*sigmaz(b2)

Jy3 = 0.5*sigmay(b3)
Jz3 = 0.5*sigmaz(b3)


println("U is creating.")
# Floquet operators
# U1 for j=j1
U1 = exp(dense(-1im*k1*Jy1*Jy1/(2*(j1+1/2))))*exp(dense(-1im*α*Jz1));


# U2 for j=j2
U2 = exp(dense(-1im*k2*Jy2*Jy2/(2*(j2+1/2))))*exp(dense(-1im*α*Jz2));


# U3 for j=j3
U3 = exp(dense(-1im*k3*Jy3*Jy3/(2*(j3+1/2))))*exp(dense(-1im*α*Jz3));


# U12 Floquet for coupling term
U12 = exp(dense(-1im * Δ12*(Jy1⊗Jy2) / (2 * (j1 + 1/2) * (j2 + 1/2))));

# U23 Floquet for coupling term
U23 = exp(dense(-1im * Δ23*(Jy2⊗Jy3) / (2 * (j2 + 1/2) * (j3 + 1/2))));


# Unitary floquet operator of whole system
U = (U12⊗dense(identityoperator(b3)))*(dense(identityoperator(b1))⊗U23)*(U1 ⊗ U2 ⊗ U3)
println("u is created as dense matrix.")


OTOC12_max = zeros(1,kicks)
OTOC23_max = zeros(1,kicks)

# making Hilbert space in bigger Hilbert space
At =  dense(identityoperator(b1) ⊗ exp(dense(im*Jz2)) ⊗ identityoperator(b3))
B1 =   dense(exp(dense(im*Jz1)) ⊗ identityoperator(b2) ⊗ identityoperator(b3))
B3 =  dense(identityoperator(b1) ⊗ identityoperator(b2) ⊗ exp(dense(im*Jz3)))

d = (2*j1+1)*(2*j2+1)*(2*j3+1)

println("Time evolution is started.")
println("data will be save as: monogamydata/monogomyOTOC_$j1 $j2 $j3 $k1 $k2 $k3 $Δ12 $Δ23 $kicks.npy")
t1 = time()# start counting time
for i = 1:kicks
	global At
	global B1
	global B3
	global d
	global U
	global t1
    commutator2 = At * B1 - B1 * At
    OTOC12_max[1,i] = (1/d)*tr(dagger(commutator2)*commutator2)
    
    commutator3 = At * B3 - B3 * At
    OTOC23_max[1,i] = (1/d)*tr(dagger(commutator3)*commutator3)
       
    At = U*At*dagger(U)
    
    if time() - t1 > 10*60 && i < kicks
    	# data saving
		save_data = [OTOC12_max; OTOC23_max]
		npzwrite("monogamydata/monogomyOTOC_$j1 $j2 $j3 $k1 $k2 $k3 $Δ12 $Δ23 $kicks.npy", save_data)
    	println("Till kicks= $i is done. Programme pause for 5min for cooling.")
    	sleep(5*60)
    	t1 = time()
    	println("Programme start again.")
    end
end

println("Saving data...")
# data saving
save_data = [OTOC12_max; OTOC23_max]
npzwrite("monogamydata/monogomyOTOC_$j1 $j2 $j3 $k1 $k2 $k3 $Δ12 $Δ23 $kicks.npy", save_data)
println("Data saved in name of: monogamydata/monogomyOTOC_$j1 $j2 $j3 $k1 $k2 $k3 $Δ12 $Δ23 $kicks.npy")


























