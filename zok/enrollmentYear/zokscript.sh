# 1st argument: zok program filename
# 2nd argument: prefix to output filenames
zokrates compile --input $1
zokrates setup
zokrates export-verifier
vname="$2_verifier.sol"
mv verifier.sol $vname
mv $vname ../../contracts/