function get_args(jobname)
    arguments = {}
    flag = false
    flagline = -1

    for index,argument in ipairs(arg) do
        io.write("\n" .. index .. "   " .. argument)
        if flag then
            -- Note that this will start indexing from 1 (n + 1 - n). Trying to subtract 1 and index
            -- from 0 makes #(args) return 0 for one arg commands, for some godforsaken reason.
            arguments[index - flagline] = argument
        elseif argument:match("%.tex$") then -- jobname is only the filename so we need to check against arg ending
            flag = true
            flagline = index
            io.write("\n........" )
        end
    end
    io.write("\n")
    return arguments
end


function getType(jobname, bookNo)
    args = get_args(jobname)
    -- Generic error message
    error_string = "\nPlease run `lualatex hpmor-" .. bookNo .. ".tex ebook` or `lualatex hpmor-" .. bookNo .. ".tex print' to specify the type of the PDF"

    if not args == nil then
        for index, arg in ipairs(args) do
            io.write(index .. "  " .. arg .. "\n")
        end
    end

    if #(args) == 0 then -- No arguments given
        error("No argument given." .. error_string)
    elseif #(args) > 1 then -- Given more than one argument
        error("Too many arguments." .. error_string)
    elseif args[1] == "ebook" then -- Ebook Version
        token.set_macro("hpBookType", "0")
    elseif args[1] == "print" then -- Print Version
        token.set_macro("hpBookType", "1")
    else -- One argument neither ebook nor print
        error("Invalid argument: " .. args[1] .. "\n" .. error_string)
    end

end
