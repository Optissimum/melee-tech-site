# zs-starter-template

This is a [zs](https://git.mills.io/prologic/zs) starter template. A live version of this site can be found [here](https://zs.mills.io).

## Features

- A basic index page with the content you see here
- A basic layout using a modified version of [bahunya][bahunya] for style
- [live.js](live.js) for faster development
- Examples of several built-in extensions

## Quick Start

```console
git clone https://git.mills.io/prologic/zs-starter-template.git
cd zs-starter-template
make dev
```

Open your browser to http://localhost:8000

## Examples

Aside from the regular Markdown [[TestPage]] that demonstrates the full capabilities of the Markdown support for [zs][zs], there are a number of additional extensions enabled by default:

### Anchors

With the [anchors][anchors] extension so you can link to any section(s) on the page like [Quick Start](#quick-start).

> 💡 **Tip:** Try hovering over any of the headings on this page!

### D2 Diagrams

With the [d2][d2] extension you can draw and diagrams such as:

```d2
x -> y
```

### Embed

With the [embed][embed] extension you can embed [Youtube][youtube] videos like:

![](https://www.youtube.com/watch?v=dQw4w9WgXcQ)

### Fences

With the [fences][fences] extension you can 
:::{.blue}
## Life Inside Fences

We are now inside a div with the css-class "blue". This can be used to style this block

:::{#insideme .red data="important"}
fences can be nested and given ids as well as classes
:::
:::

### Highlighting

With the [highlighting][highlighting] extension you can syntax highlight code samples:

```go
package main

import "fm"

func main() {
    fmt.Println("Hello World!");
}
```

### Wiki Links

With the [wikilink][wikilink] extension you can link to other pages more easily like [[SandBox]].

### We can even do slides!

{{ list slides }}

### And Kanban Boards!

- [[TODO]]

### Remember cgi scripts?

- [[TestCGI]]

## License

`zs-starter-template` is licensed under the terms of the [WTFPL License](/LICENSE)

[anchor]: https://github.com/abhinav/goldmark-anchor
[d2]: https://github.com/FurqanSoftware/goldmark-d2
[embed]: https://github.com/13rac1/goldmark-embed
[fences]: https://github.com/stefanfritsch/goldmark-fences
[highlighting]: https://github.com/yuin/goldmark-highlighting
[wikilink]: https://github.com/abhinav/goldmark-wikilink
[zs]: https://git.mills.io/prologic/zs
[bahunya]: https://github.com/Kimeiga/bahunya
