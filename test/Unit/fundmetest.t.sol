// SPDX-License-Identifier: MIT
/*pragma solidity ^0.8.19;

import {Test} from "forge-std/Test.sol";  // Importing Foundry's Test contract
import {FundMe} from "../src/FundMe.sol"; // Ensure contract name matches
import {DeployFundMe} from "../script/DeployFundMe.s.sol"; // Correct import

contract FundMeTest is Test {
    FundMe public fundMe;

    function setUp() external {
    DeployFundMe deployFundMe = new DeployFundMe();
    (fundMe, ) = deployFundMe.run(); // Extract FundMe and ignore HelperConfig
}

    function testMinimumDollarIsFive() public {
        assertEq(fundMe.MINIMUM_USD(), 5e18);
    }

    function testOwnerIsMsgSender() public {
        assertEq(fundMe.i_owner(), address(this));
    }

    function testPriceFeedVersionIsAccurate() public {
        uint256 version = fundMe.getVersion();
        assertEq(version, 4);
    }
}
*/
pragma solidity ^0.8.19;

import {Test} from "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol"; // Ensure proper capitalization
import {DeployFundMe} from "../script/DeployFundMe.s.sol"; // Ensure file name matches

contract FundMeTest is Test {
    FundMe public fundMe;

  function setUp() external {
        DeployFundMe deployFundMe = new DeployFundMe();
        (fundMe, ) = deployFundMe.run(); // Extract FundMe and ignore HelperConfig
    }
    function testMinimumDollarIsFive() public view { // Added "view" to remove warnings
        assertEq(fundMe.MINIMUM_USD(), 5e18);
    }

    function testOwnerIsMsgSender() public view { // Added "view" to remove warnings
        assertEq(fundMe.i_owner(), msg.sender);
    }

    function testPriceFeedVersionIsAccurate() public view { // Fixed function name & added "view"
        uint256 version = fundMe.getVersion();
        assertEq(version, 4);
    }

    function testfundfailwithoutenougheth() public{
        vm.expectRevert();
        fundMe.fund();
    }

    function testfundupdatetestdatastructure() public{
        fundMe.fund{value: 10e18}();

        uint256 amountFunded = fundMe.addressToAmountFunded(address(this));
        assertEq(amountFunded, 10e18);
    }
}

