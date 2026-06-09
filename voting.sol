// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract Voting {
    address public owner ;

candidate [] public candidates ;

mapping (address => bool ) public register ;

mapping(address => bool) public voted ;

struct candidate {
    string name ;
    uint vote ;
}

constructor () {
    owner = msg.sender ;
}

function Addcandidate (string memory name  ) public {
    require( msg.sender == owner  , "only owner can call this function ");
    candidates.push(candidate(name  , 0)) ;
}


function registration () public {
    require(!register[msg.sender ] , "you are allredy register") ;
   register[msg.sender] = true ;
}

function vote (uint index ) public {
    require(!voted[msg.sender], "you are allerdy voted"); 
    require(register[msg.sender] , "vote only register name ");

    voted[msg.sender] = true ;
    candidates[index]. vote++ ;

}
function Winner() public view returns (string memory , uint ) {
    require(candidates.length> 0 , "no candidates find ");
   uint  maxvote = 0;
    uint winnerindex = 0 ;
    for(uint i = 0 ; i< candidates.length; i++) {
        if(candidates[i].vote > maxvote) {
            maxvote = candidates[i].vote ;
            winnerindex = i ;

        }

    }
    return (
candidates[winnerindex].name ,
candidates[winnerindex].vote  

    );


}


}