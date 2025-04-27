let useToggle = (~init: bool=false) => {
  let (isOpen, setIsOpen) = React.useState(_ => init)
  let toggleOpen = () => setIsOpen(val => !val)
  (isOpen, toggleOpen, setIsOpen)
}
