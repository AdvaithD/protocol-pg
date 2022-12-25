# Force compile
build:; forge build --force

build-log:; forge build --names

clean:; forge clean

test:; forge test 

test-watch:; forge test --watch -vvvv

test-log:; forge test -vvv

test-trace:; forge test -vvvv

test-gas-report:; forge test --gas-report -vvv

test-match:; forge test --match-contract $(contract) -vvvv

test-match-test:; forge test --match-test $(test) -vvvv

todo:; grep -r "TODO" ./src

define create_svg
	tail -1 $(1)
endef

svg:; forge run src/scripts/Contract.sol -vvv > token.svg && $(call create_svg, "token.svg")

# Deployments
deploy-contract:; 
	forge create $(contract) \
	--constructor-args $(constructorArgs) \
	--rpc-url $(url) \
	--private-key $(privateKey)

deploy-contract-no-args:; 
	forge create $(contract) \
	--rpc-url $(url) \
	--private-key $(privateKey)

# Verification
verify-contract:; 
	forge verify-contract \
	--chain-id $(chainId) \
	--constructor-args `cast abi-encode "$(constructorSig)" $(constructorArgs)` \
	--compiler-version $(compilerVersion) \
	--num-of-optimizations 200 \
	$(address) \
	$(contract) \
	$(apiKey) 

verify-contract-no-args:; 
	forge verify-contract \
	--chain-id $(chainId) \
	--compiler-version $(compilerVersion) \
	--num-of-optimizations 200 \
	$(address) \
	$(contract) \
	$(apiKey) 
