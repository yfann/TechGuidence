+ transition

```css
img{
    transition: 1s 1s height ease;
}

img{
    transition-property: height;
    transition-duration: 1s;
    transition-delay: 1s;
    transition-timing-function: ease;
}
```
+ animation

```css
div:hover {
  animation: 1s 1s rainbow linear 3 forwards normal;
}

div:hover {
  animation-name: rainbow;
  animation-duration: 1s;
  animation-timing-function: linear;
  animation-delay: 1s;
  animation-fill-mode:forwards;
  animation-direction: normal;
  animation-iteration-count: 3;
}

@keyframes rainbow {
  0% { background: #c00; }
  50% { background: orange; }
  100% { background: yellowgreen; }
}
```

+ [conic-gradient](https://www.cnblogs.com/coco1s/p/7079529.html)

## ref
+ [CSS动画简介](http://www.ruanyifeng.com/blog/2014/02/css_transition_and_animation.html)
+ [cubic-bezier](http://cubic-bezier.com/#.24,.95,.75,-0.05)
+ [typing demo](http://dabblet.com/gist/1745856)