return {
  {
    Strong = function (el)
      return pandoc.SmallCaps(el.content)
    end,
    Link = function (el)
      return pandoc.Div(el.content)
    end,
  }
}


