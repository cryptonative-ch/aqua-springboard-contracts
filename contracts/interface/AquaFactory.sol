// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.6.8;

interface IAquaFactory {
  function launchTemplate(
    uint256 _templateId,
    bytes calldata _data,
    string calldata _metaData
  ) external payable returns (address newTemplate);
}
