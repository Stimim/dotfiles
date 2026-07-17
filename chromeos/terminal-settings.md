**Use NerdFont (credit to yumaokuo@)**

(Chrome OS) → Terminal App → Connect to some host → `<ctrl+shift+j>` → paste the following:

```javascript
// 1. Clear out any old, broken settings
term_.prefs_.set('user-css', '');

// 2. Inject the CSS locally, but pull the font from a secure HTTPS CDN
const hackCSS = `
@font-face { 
  font-family: "UbuntuMono Nerd Font";
  src: url("https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/UbuntuMono/Regular/UbuntuMonoNerdFont-Regular.ttf") format("truetype");
}
x-row {
  text-rendering: optimizeLegibility;
  font-variant-ligatures: normal;
}
`;
term_.prefs_.set('user-css-text', hackCSS);

// 3. Set the terminal to use our new font
term_.prefs_.set('font-family', '"UbuntuMono Nerd Font", monospace');

console.log("Setting applied! Refreshing...");
setTimeout(() => location.reload(), 500);
```
