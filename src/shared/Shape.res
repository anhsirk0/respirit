module Clip = {
  type id = float
  type t = {
    id: id,
    content: string,
    createdAt: float,
    updatedAt: float,
  }

  let make = () => {
    let date = Date.now()
    {
      id: date,
      content: "",
      createdAt: date,
      updatedAt: date,
    }
  }

  let defaultClips = [
    {
      id: 0.,
      content: "Welcome to Clips",
      createdAt: Date.now(),
      updatedAt: Date.now(),
    },
  ]
}

module Stringman = {
  let toLower = String.toLowerCase
  let toUpper = String.toUpperCase
  let toCapitalize = str =>
    str->String.charAt(0)->String.toUpperCase ++ str->String.sliceToEnd(~start=1)
  let toTitle = str => str->String.split(" ")->Array.map(toCapitalize)->Array.join(" ")

  let chunks = str =>
    str
    ->String.replaceAllRegExp(%re("/(\s+|-+|_+)/g"), " ")
    ->String.split(" ")

  let toCamel = str =>
    str
    ->chunks
    ->Array.mapWithIndex((s, idx) => idx == 0 ? s->toLower : s->toCapitalize)
    ->Array.join("")

  let toPascal = str =>
    str
    ->chunks
    ->Array.map(toCapitalize)
    ->Array.join("")

  let toSnake = str =>
    str
    ->chunks
    ->Array.map(toLower)
    ->Array.join("_")

  let toScreamingSnake = str =>
    str
    ->chunks
    ->Array.map(toUpper)
    ->Array.join("_")

  let toKebab = str =>
    str
    ->chunks
    ->Array.map(toLower)
    ->Array.join("-")

  let toAltCaps = str =>
    str
    ->String.split("")
    ->Array.mapWithIndex((c, idx) => idx->Int.mod(2) == 0 ? c->toLower : c->toUpper)
    ->Array.join("")

  type t = {title: string, fn: string => string}

  let ops = [
    {title: "Lowercase", fn: toLower},
    {title: "Uppercase", fn: toUpper},
    {title: "Capitalize", fn: toCapitalize},
    {title: "Title Case", fn: toTitle},
    {title: "Camel Case", fn: toCamel},
    {title: "Pascal Case", fn: toPascal},
    {title: "Snake Case", fn: toSnake},
    {title: "Screaming Snake Case", fn: toScreamingSnake},
    {title: "Kebab Case", fn: toKebab},
    {title: "AltCaps Case", fn: toAltCaps},
  ]
}
