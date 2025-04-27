// DaisyUI themes
let themes = [
  "cupcake",
  "light",
  "dark",
  "bumblebee",
  "emerald",
  "corporate",
  "synthwave",
  "retro",
  "cyberpunk",
  "valentine",
  "halloween",
  "garden",
  "forest",
  "aqua",
  "lofi",
  "pastel",
  "fantasy",
  "wireframe",
  "black",
  "luxury",
  "dracula",
  "cmyk",
  "autumn",
  "business",
  "acid",
  "lemonade",
  "night",
  "coffee",
  "winter",
  "dim",
  "nord",
  "sunset",
  "caramellatte",
  "abyss",
  "silk",
]

@react.component
let make = () => {
  let {settings, update} = Store.Settings.use()

  let onChange = theme => {
    theme->Util.Dom.setTheme
    update({theme: theme})
  }

  let themeCards = themes->Array.map(theme =>
    <ThemeCard theme onChange key=theme>
      {theme->React.string}
      {settings.theme == theme ? <Icon.medal className="size-6" weight="fill" /> : React.null}
      <div className="grow" />
      <div className="flex flex-row gap-1 rounded-btn [&>div]:h-6 [&>div]:w-2">
        <div className="bg-primary" />
        <div className="bg-accent" />
        <div className="bg-secondary" />
        <div className="bg-neutral" />
      </div>
    </ThemeCard>
  )

  themeCards->React.array
}
