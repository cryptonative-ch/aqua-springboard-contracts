// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.6.8;

import "@openzeppelin/contracts/access/Ownable.sol";

contract AquaSpringboard is Ownable {
  /// @dev Events
  event SpringboardInitialized(
    address factory,
    address saleLauncher,
    address templateLauncher
  );
  event FactoryUpdated(address indexed factory);
  event SaleLauncherUpdated(address indexed saleLauncher);
  event TemplateLauncherUpdated(address indexed templateLauncher);

  /// @dev Public references
  address public factory;
  address public saleLauncher;
  address public templateLauncher;
  address public governor;
  bool public isInitialized = false;

  constructor() public {
    governor = msg.sender;
  }

  modifier isGovernor() {
    require(msg.sender == governor, "AquaSpringboard: REQUIRES_GOVERNOR");
    _;
  }

  function initialize(
    address _factory,
    address _saleLauncher,
    address _templateLauncher
  ) public {
    require(!isInitialized, "AquaSpringboard: ALREADY_INTTIALIZED");

    factory = _factory;
    saleLauncher = _saleLauncher;
    templateLauncher = _templateLauncher;
    isInitialized = true;

    emit SpringboardInitialized(factory, saleLauncher, templateLauncher);
  }

  function setFactory(address _factory) public {
    require(_factory != address(0), "NOT_ADDRESS");

    factory = _factory;

    emit FactoryUpdated(factory);
  }

  function setSaleLauncher(address _saleLauncher) public {
    require(_saleLauncher != address(0), "NOT_ADDRESS");

    saleLauncher = _saleLauncher;

    emit SaleLauncherUpdated(saleLauncher);
  }

  function setTemplateLauncher(address _templateLauncher) public {
    require(_templateLauncher != address(0), "NOT_ADDRESS");

    templateLauncher = _templateLauncher;

    emit TemplateLauncherUpdated(templateLauncher);
  }

  /// @dev function to launch a template on Aqua
  /// @param _templateId template to be deployed
  /// @param _saleModuleId template to be deployed
  /// @param _data encoded template parameters
  /// @param _metadata IPFS hash pointing to sale metadata
  function launchSale(
    uint256 _templateId,
    uint256 _saleModuleId,
    bytes calldata _data,
    string calldata _metadata
  ) public {
    // launch sale template from the Factory
    address memory saleTemplate = IAquaFactory(factory).launchTemplate(
      _templateId,
      _data,
      _metadata
    );

    // launch and initialize the sale contract from the SaleLauncher
  }
}
