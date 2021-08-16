// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.6.8;

interface AquaSpringboard {
  /// @dev Public references
  function factory() external view returns (address);

  function saleLauncher() external view returns (address);

  function templateLauncher() external view returns (address);

  function governor() external view returns (address);

  function initialize(
    address _factory,
    address _saleLauncher,
    address _templateLauncher
  ) external;

  function setFactory(address _factory) external;

  function setSaleLauncher(address _saleLauncher) external;

  function setTemplateLauncher(address _templateLauncher) external;

  function setTemplateLauncher(uint256 _templateId, bytes calldata _saleData)
    external;
}
