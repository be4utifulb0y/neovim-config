local M = {}

M.pyright_analysis = {
    --indexing = true,
    typeCheckingMode = "basic",
    diagnosticMode = "workspace",
    autoImportCompletions = true,
    --autoSearchPaths = true,
    inlayHints = {
        variableTypes = true,
        functionReturnTypes = true,
    },
    useLibraryCodeForTypes = true,
    diagnosticSeverityOverrides = {
        reportArgumentType = "none",
        reportAttributeAccessIssue = "none",
        reportCallIssue = "none",
        reportFunctionMemberAccess = "none",
        reportGeneralTypeIssues = "none",
        reportIncompatibleMethodOverride = "none",
        reportIncompatibleVariableOverride = "none",
        reportIndexIssue = "none",
        reportOptionalMemberAccess = "none",
        reportOptionalSubscript = "none",
        reportPrivateImportUsage = "none",
    }
}

M.python = {
    pythonPath = "D:/Application/miniconda/envs/yolov8/python.exe",
    analysis = M.pyright_analysis
}

return M
