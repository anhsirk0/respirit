%%raw("import './index.css'")

switch ReactDOM.querySelector("#root") {
| Some(root) =>
  ReactDOM.Client.createRoot(root)->ReactDOM.Client.Root.render(
    <React.StrictMode>
      <App />
    </React.StrictMode>,
  )
| None => ()
}
