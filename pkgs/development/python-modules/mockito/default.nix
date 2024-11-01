{
  lib,
  buildPythonPackage,
  fetchPypi,
  hatchling,
  numpy,
  pytestCheckHook,
  pythonOlder,
}:

buildPythonPackage rec {
  pname = "mockito";
  version = "1.5.1";
  pyproject = true;

  disabled = pythonOlder "3.7";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-QFYkCRcVzDlU4vo5zFDlCNWXeNTS+1bI23v6X1k9MwM=";
  };

  nativeBuildInputs = [ hatchling ];

  nativeCheckInputs = [
    numpy
    pytestCheckHook
  ];

  pythonImportsCheck = [ "mockito" ];

  meta = with lib; {
    description = "Spying framework";
    homepage = "https://github.com/kaste/mockito-python";
    changelog = "https://github.com/kaste/mockito-python/blob/${version}/CHANGES.txt";
    license = licenses.mit;
    maintainers = [ ];
  };
}
