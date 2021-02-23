@# Icon

<div class="@ns-callout @ns-intent-primary @ns-icon-info-sign">

See the [**Icons package**](#icons) for a searchable list of all available UI icons.

</div>

<div class="@ns-callout @ns-intent-primary @ns-icon-info-sign">
    <h4 class="@ns-heading">如何添加 hipa 定制版 icon</h4>

1. 从 figma 中下载所需的 svg 素材（命名规范为数字/小写字母/中划线.svg）至 ```/packages/icons/resources/icons/```
2. 根据素材的还原尺寸，放在相应的 folder 中
3. 在 ```/packages/icons``` 下运行 ```yarn compile```
4. node脚本会将素材生成 svg path 并匹配 IconName 渲染，不需要关心此过程。例如： ```/packages/icons/resources/icons/16px/add-table-dark.svg``` 会生成 ```"add-table-dark-16px"``` 的 icon prop, 使用方式同理 ```<Icon icon="add-table-dark-16px" />```
5. 生成的 icon prop 类型为 ```IconNameHipa```
6. 旧的 blueprint icon 可继续使用，后续完成全量替换后再干掉

</div>

<div class="@ns-callout @ns-intent-primary @ns-icon-info-sign">
    <h4 class="@ns-heading">SVG icons in 2.0</h4>

Blueprint 2.0 introduced SVG icon support and moved icon resources to a separate __@blueprintjs/icons__ package.
The `Icon` component renders SVG paths and the icon classes are no longer used by any Blueprint React component.
Icon font support has been preserved but should be considered a legacy feature that will be removed in a
future major version.

</div>

This section describes two ways of using the UI icon font: via React `Icon`
component to render SVG images or via CSS classes to use the icon font.

Many Blueprint components provide an `icon` prop which accepts an icon name
(such as `"history"`) or a JSX element to use as the icon.

@reactExample IconExample

@## Props

Use the `<Icon>` component to easily render __SVG icons__ in React. The `icon`
prop is typed such that editors can offer autocomplete for known icon names. The
optional `iconSize` prop determines the exact width and height of the icon
image; the icon element itself can be sized separately using CSS.

The HTML element rendered by `<Icon>` can be customized with the `tagName` prop
(defaults to `span`), and additional props are passed to this element.

Data files in the __@blueprintjs/icons__ package provide SVG path information
for Blueprint's 300+ icons for 16px and 20px grids. The `icon` prop dictates
which SVG is rendered and `iconSize` determines which pixel grid is used:
`iconSize >= 20` will use the 20px grid and smaller icons will use the 16px
grid.

```tsx
import { Icon, Intent } from "@blueprintjs/core";
import { IconNames } from "@blueprintjs/icons";

// string literals are supported through IconName union type
<Icon icon="cross" />
<Icon icon="globe" iconSize={20} />

// constants are provided for name and size
<Icon icon={IconNames.GRAPH} iconSize={Icon.SIZE_LARGE} intent={Intent.PRIMARY} />

// can pass all valid HTML props
<Icon icon="add" onClick={this.handleAdd} onKeyDown={this.handleAddKeys} />
```

```html
<Icon icon="globe" iconSize={30} />
<!-- renders the following HTML markup: -->
<svg class="@ns-icon" data-icon="globe" width="30" height="30" viewBox="0 0 20 20">
    <title>globe</title>
    <path ... />
</svg>
```

@interface IIconProps

@## CSS

<div class="@ns-callout @ns-intent-danger @ns-icon-warning-sign">
    <h4 class="@ns-heading">Icon fonts are legacy in 2.0</h4>

Blueprint's icon fonts should be considered a legacy feature and will be removed in a future major version.
The SVGs rendered by the React component do not suffer from the blurriness of icon fonts, and browser
support is equivalent.

__Important__: Blueprint icons added after `@blueprintjs/icons@3.14.0` do not have icon font support.

</div>

The CSS-only icons API uses the __icon fonts__ from the __@blueprintjs/icons__ package.

To use Blueprint UI icons via CSS, you must apply two classes to a `<span>` element:
- a __sizing class__, either `@ns-icon-standard` (16px) or `@ns-icon-large` (20px)
- an __icon name class__, such as `@ns-icon-projects`

Icon classes also support the four `.@ns-intent-*` modifiers to color the image.

```html
<span class="@ns-icon-{{size}} @ns-icon-{{name}}"></span>

<span class="@ns-icon-standard @ns-icon-projects"></span>
<span class="@ns-icon-large @ns-icon-geosearch @ns-intent-success"></span>
```

<div class="@ns-callout @ns-intent-primary @ns-icon-info-sign">
    <h4 class="@ns-heading">Non-standard sizes</h4>

Generally, font icons should only be used at either 16px or 20px. However, if a non-standard size is
necessary, set a `font-size` that is whole multiple of 16 or 20 with the relevant size class.
You can instead use the class `@ns-icon` to make the icon inherit its size from surrounding text.

</div>
