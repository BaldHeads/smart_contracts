pragma solidity ^0.5.0;

// lvl 3: equity plan
contract DeferredEquityPlan {
    address humanResources;

    address payable employee; // bob
    bool active = true; // this employee is active at the start of the contract

    // Set the total shares and annual distribution
    uint totalShares = 1000;
    uint annualDistribution = 250;

    // Set the `unlock_time` to be 365 days from now
    uint startTime = now; // permanently store the time this contract was initialized
    uint unlockTime = startTime + 365 days;

    uint public distributedShares; // starts at 0

    constructor(address payable _employee) public {
        humanResources = msg.sender;
        employee = _employee;
    }
    
    // fastFwd function FOR TESTING ONLY; make sure it is commented out for real deployment
    // function fastFwd() public {
    //     startTime += 100 days;
    // }
    
    function distribute() public {
        require(msg.sender == humanResources || msg.sender == employee, "You are not authorized to execute this contract.");
        require(active == true, "Contract not active.");

        // Add "require" statements to enforce that:
        // 1: `unlock_time` is less than or equal to `now`
        // 2: `distributed_shares` is less than the `total_shares`
        require(unlockTime <= now, "The required waiting period has not been met for share dispersal.");
        require(distributedShares < totalShares, "Disperse cannot exceed total shares.");

        // Add 365 days to the `unlock_time`
        unlockTime += 365 days;

        //Calculate the shares distributed by using the function (now - start_time) / 365 days * the annual distribution
        // Make sure to include the parenthesis around (now - start_time) to get accurate results!
        distributedShares = (now - startTime) / 365 days * annualDistribution;

        // double check in case the employee does not cash out until after 5+ years
        if (distributedShares > 1000) {
            distributedShares = 1000;
        }
    }

    // human_resources and the employee can deactivate this contract at-will
    function deactivate() public {
        require(msg.sender == humanResources || msg.sender == employee, "You are not authorized to deactivate this contract.");
        active = false;
    }

    // Since we do not need to handle Ether in this contract, revert any Ether sent to the contract directly
    function() external payable {
        revert("Do not send Ether to this contract!");
    }
}