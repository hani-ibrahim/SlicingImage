# SlicingImage
Slice Image into small images and animate them

![](https://github.com/hani-ibrahim/SlicingImage/raw/master/fade-demo.gif)

# Usage
SlicingImage needs `ImageDivider` and `Animator`

### ImageDivider
Takes image and return array of images after slicing them
```swift
public protocol ImageDivider {
    func divide(image: UIImage, into count: Int, inTotalSize totalSize: CGSize) -> [UIView]
}
```

### Animator
Takes a percentage 0 --> 1 and array of UIViews to update their status for the current percentage
```swift
public protocol Animator {
    func update(progress: CGFloat, for slices: [UIView])
}
```

# License
MIT License

> Copyright (c) 2017 Hani Ibrahim
> 
> Permission is hereby granted, free of charge, to any person obtaining a copy
> of this software and associated documentation files (the "Software"), to deal
> in the Software without restriction, including without limitation the rights
> to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> copies of the Software, and to permit persons to whom the Software is
> furnished to do so, subject to the following conditions:
> 
> The above copyright notice and this permission notice shall be included in all
> copies or substantial portions of the Software.
> 
> THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
> AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
> SOFTWARE.
