local convert = {}

function convert.camelCaseToSnakeCase(str)
    -- convert camelCase to snake_case and remove the first underscore
    return str:gsub("([A-Z])", function(c) return "_" .. c:lower() end):sub(2)
end

function convert.dashAndSentenceToSnakeCase(str)
    -- convert dash-and-sentence to snake_case
    return str:gsub("([A-Z])", function(c) return "_" .. c:lower() end):gsub("-", "_"):gsub(" ", "_")
end

return convert