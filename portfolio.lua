-- portfolio.lua

function linking(word)
    local element = word
    if string.sub(word.text, 1, 5) == "++gh:" then
        element = pandoc.Link(
            pandoc.Image({}, "/github.png", "", {}),
            "https://github.com/jandermoreira/" .. string.sub(word.text, 6),
            "GitHub",
            { target = "_blank"}
        )
    elseif string.sub(word.text, 1, 7) == "++ctan:" then
        element = pandoc.Link(
            pandoc.Image({}, "/ctan.png", "", {}),
            "https://ctan.org/pkg/" .. string.sub(word.text, 8),
            "CTAN",
            { target = "_blank"}
        )
    end 
    return element
end

return {
    {Str = linking}
}