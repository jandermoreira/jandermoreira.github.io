-- portfolio.lua

function www(link)
    quarto.log.output(link.target)
    if link.content[1] and pandoc.utils.stringify(link.content[1]) == "++www" then
        link.content[1] = pandoc.Image(
            {},
            "/globo.png",
            link.target,
            { target = "_blank" }
        )
    end
    return link
end

function linking(word)
    local element = word
    if string.sub(word.text, 1, 5) == "++gh:" then
        element = pandoc.Link(
            pandoc.Image({}, "/github.png", "", {}),
            "https://github.com/jandermoreira/" .. string.sub(word.text, 6),
            "GitHub: " .. string.sub(word.text, 6),
            { target = "_blank" }
        )
    elseif string.sub(word.text, 1, 7) == "++ctan:" then
        element = pandoc.Link(
            pandoc.Image({}, "/ctan.png", "", {}),
            "https://ctan.org/pkg/" .. string.sub(word.text, 8),
            "CTAN: " .. string.sub(word.text, 8),
            { target = "_blank" }
        )
    end
    return element
end

return {
    { Str = linking },
    { Link = www },
}
