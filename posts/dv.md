# Dynamic Viewports with CSS

2023-02-08

I think it's safe to assume most web designers and developers are familiar with the standard `vh` and `vw` parameters in CSS. These parameters are used for setting an element's height and/or width, relative to the viewport (v) height (h) or width (w). For example:

If I want my `.box` element to take up the entire height of a device's screen:

```css
.box {
  height: 100vh;
}
```

Or I want my `.box` element to take up the entire width of a device's screen:

```css
.box {
  width: 100vw;
}
```


These are wonderful options to have - specifically for those of us designing web applications. But there are some *minor* issues with `vh` and `vw`.

1. The setting does not take into account device-specific UI (status bars, toolbars, search fields etc.)
2. In some instances these will not play nice with `box-sizing` properties

## Have No Fear, Dynamic Viewport is Here!

Lucky for us there exists an awesome *new-ish* CSS API called dynamic viewport-percentage units: `dvh` & `dvw`. They are defined as follows:

> The dynamic viewport-percentage units (dv) are defined with respect to the dynamic viewport size: the viewport sized with dynamic consideration of any UA interfaces that are dynamically expanded and retracted. This allows authors to size content such that it can exactly fit within the viewport whether or not such interfaces are present.

So our examples above would translate into:

```css
.box {
  height: 100dvh;
  width: 100dvw;
}
```

### What About Browser Support?

[Can I Use Stats](https://caniuse.com/mdn-api_css_dvh) / ~67.17% coverage.

**Note:** Even though the caniuse page states that Firefox 109+ and iOS Safari 16.3 do not support `dvh`, in my experiments they do. I'm not sure what testing was done for those two browsers, so YMMV.

If you want to play it safe, use dynamic viewports with standard "traditional" viewports as backup. That way you support all use cases while still taking advantage of newer CSS properties.