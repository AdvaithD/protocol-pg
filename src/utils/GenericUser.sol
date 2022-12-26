// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.15;

contract GenericUser {
    function tryCall(address target, bytes memory data, uint256 value_)
        public
        virtual
        returns (bool success, bytes memory returnData)
    {
        (success, returnData) = target.call{value: value_}(data);
    }

    function call(address target, bytes memory data, uint256 value) public virtual returns (bytes memory returnData) {
        bool success;
        (success, returnData) = target.call{value: value}(data);

        if (!success) {
            if (returnData.length > 0) {
                assembly {
                    let returnDataSize := mload(returnData)
                    revert(add(32, returnData), returnDataSize)
                }
            } else {
                revert("REVERTED_WITHOUT_MESSAGE");
            }
        }
    }

    receive() external payable {}
}
