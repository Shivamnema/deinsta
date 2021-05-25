pragma solidity ^0.5.0;

contract Deinsta {
    string public name = "Deinsta";

    struct Image {
        uint id;
        string hash;
        string description;
        uint tipAmount;
        address payable author;
    } 

    event ImageCreated(
        uint id,
        string hash,
        string description,
        uint tipAmount,
        address payable author
    );

    //image counter
    uint public imageCount = 0;
    //Store Images
    mapping (uint => Image) public images;

    //Create Images
    function uploadImage(string memory _imgHash, string memory _description) public {
        require(bytes(_description).length > 0);
        require(bytes(_imgHash).length > 0);
        require(msg.sender != address(0x0));

        //Increament image id
        imageCount++;
        images[imageCount] = Image(imageCount, _imgHash, _description, 0, msg.sender);
        
        emit ImageCreated(imageCount, _imgHash, _description, 0, msg.sender);

    }

    //Tip Images
    function tipImageOwner (uint _id) public payable {
        Image memory _image = images[_id];
        address payable _author =_image.author;
        _author.transfer(1 ether);
    }
}
