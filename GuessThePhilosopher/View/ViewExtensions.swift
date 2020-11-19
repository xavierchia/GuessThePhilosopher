import UIKit

// Borders and shadows
extension UIView {
    
    func authorDefaultStyling() {
        
        self.layer.borderWidth = 3
        self.layer.cornerRadius = 20
        self.layer.borderColor = #colorLiteral(red: 0.05882352941, green: 0.2980392157, blue: 0.4588235294, alpha: 1)
        self.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        self.layer.shadowRadius = 0.0
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowColor = #colorLiteral(red: 0.05882352941, green: 0.2980392157, blue: 0.4588235294, alpha: 1)

    }
    
    func buttonSelectedStyling() {
        self.layer.borderColor = #colorLiteral(red: 0, green: 0.7176470588, blue: 0.7607843137, alpha: 1)
        self.layer.shadowColor = #colorLiteral(red: 0, green: 0.7176470588, blue: 0.7607843137, alpha: 1)
        self.backgroundColor = #colorLiteral(red: 0.8625685573, green: 0.9570303559, blue: 0.9697696567, alpha: 1)
    }
}

// Disabled UI button
class CheckButton: UIButton {
    open override var isEnabled: Bool{
        didSet {
            if self.isEnabled {
                self.backgroundColor = #colorLiteral(red: 0.3452036977, green: 0.8009640574, blue: 0.006656988058, alpha: 1)
                self.layer.shadowColor = #colorLiteral(red: 0.3465779424, green: 0.6556648612, blue: 0.005139762536, alpha: 1)
                self.layer.shadowRadius = 0.0
                self.layer.shadowOffset = CGSize(width: 0, height: 5)
                self.layer.shadowOpacity = 1.0
            } else {
                self.backgroundColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
            }
        }
    }
}

// Button extension to vertical align
@IBDesignable
class LayoutableButton: UIButton {

    enum VerticalAlignment : String {
        case center, top, bottom, unset
    }


    enum HorizontalAlignment : String {
        case center, left, right, unset
    }


    @IBInspectable
    var imageToTitleSpacing: CGFloat = 8.0 {
        didSet {
            setNeedsLayout()
        }
    }


    var imageVerticalAlignment: VerticalAlignment = .unset {
        didSet {
            setNeedsLayout()
        }
    }

    var imageHorizontalAlignment: HorizontalAlignment = .unset {
        didSet {
            setNeedsLayout()
        }
    }

    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'imageVerticalAlignment' instead.")
    @IBInspectable
    var imageVerticalAlignmentName: String {
        get {
            return imageVerticalAlignment.rawValue
        }
        set {
            if let value = VerticalAlignment(rawValue: newValue) {
                imageVerticalAlignment = value
            } else {
                imageVerticalAlignment = .unset
            }
        }
    }

    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'imageHorizontalAlignment' instead.")
    @IBInspectable
    var imageHorizontalAlignmentName: String {
        get {
            return imageHorizontalAlignment.rawValue
        }
        set {
            if let value = HorizontalAlignment(rawValue: newValue) {
                imageHorizontalAlignment = value
            } else {
                imageHorizontalAlignment = .unset
            }
        }
    }

    var extraContentEdgeInsets:UIEdgeInsets = UIEdgeInsets.zero

    override var contentEdgeInsets: UIEdgeInsets {
        get {
            return super.contentEdgeInsets
        }
        set {
            super.contentEdgeInsets = newValue
            self.extraContentEdgeInsets = newValue
        }
    }

    var extraImageEdgeInsets:UIEdgeInsets = UIEdgeInsets.zero

    override var imageEdgeInsets: UIEdgeInsets {
        get {
            return super.imageEdgeInsets
        }
        set {
            super.imageEdgeInsets = newValue
            self.extraImageEdgeInsets = newValue
        }
    }

    var extraTitleEdgeInsets:UIEdgeInsets = UIEdgeInsets.zero

    override var titleEdgeInsets: UIEdgeInsets {
        get {
            return super.titleEdgeInsets
        }
        set {
            super.titleEdgeInsets = newValue
            self.extraTitleEdgeInsets = newValue
        }
    }

    //Needed to avoid IB crash during autolayout
    override init(frame: CGRect) {
        super.init(frame: frame)
    }


    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        self.imageEdgeInsets = super.imageEdgeInsets
        self.titleEdgeInsets = super.titleEdgeInsets
        self.contentEdgeInsets = super.contentEdgeInsets
    }

    override func layoutSubviews() {
        if let imageSize = self.imageView?.image?.size,
            let font = self.titleLabel?.font,
            let textSize = self.titleLabel?.attributedText?.size() ?? self.titleLabel?.text?.size(withAttributes: [NSAttributedString.Key.font: font]) {

            var _imageEdgeInsets = UIEdgeInsets.zero
            var _titleEdgeInsets = UIEdgeInsets.zero
            var _contentEdgeInsets = UIEdgeInsets.zero

            let halfImageToTitleSpacing = imageToTitleSpacing / 2.0

            switch imageVerticalAlignment {
            case .bottom:
                _imageEdgeInsets.top = (textSize.height + imageToTitleSpacing) / 2.0
                _imageEdgeInsets.bottom = (-textSize.height - imageToTitleSpacing) / 2.0
                _titleEdgeInsets.top = (-imageSize.height - imageToTitleSpacing) / 2.0
                _titleEdgeInsets.bottom = (imageSize.height + imageToTitleSpacing) / 2.0
                _contentEdgeInsets.top = (min (imageSize.height, textSize.height) + imageToTitleSpacing) / 2.0
                _contentEdgeInsets.bottom = (min (imageSize.height, textSize.height) + imageToTitleSpacing) / 2.0
                //only works with contentVerticalAlignment = .center
                contentVerticalAlignment = .center
            case .top:
                _imageEdgeInsets.top = (-textSize.height - imageToTitleSpacing) / 2.0
                _imageEdgeInsets.bottom = (textSize.height + imageToTitleSpacing) / 2.0
                _titleEdgeInsets.top = (imageSize.height + imageToTitleSpacing) / 2.0
                _titleEdgeInsets.bottom = (-imageSize.height - imageToTitleSpacing) / 2.0
                _contentEdgeInsets.top = (min (imageSize.height, textSize.height) + imageToTitleSpacing) / 2.0
                _contentEdgeInsets.bottom = (min (imageSize.height, textSize.height) + imageToTitleSpacing) / 2.0
                //only works with contentVerticalAlignment = .center
                contentVerticalAlignment = .center
            case .center:
                //only works with contentVerticalAlignment = .center
                contentVerticalAlignment = .center
                break
            case .unset:
                break
            }

            switch imageHorizontalAlignment {
            case .left:
                _imageEdgeInsets.left = -halfImageToTitleSpacing
                _imageEdgeInsets.right = halfImageToTitleSpacing
                _titleEdgeInsets.left = halfImageToTitleSpacing
                _titleEdgeInsets.right = -halfImageToTitleSpacing
                _contentEdgeInsets.left = halfImageToTitleSpacing
                _contentEdgeInsets.right = halfImageToTitleSpacing
            case .right:
                _imageEdgeInsets.left = textSize.width + halfImageToTitleSpacing
                _imageEdgeInsets.right = -textSize.width - halfImageToTitleSpacing
                _titleEdgeInsets.left = -imageSize.width - halfImageToTitleSpacing
                _titleEdgeInsets.right = imageSize.width + halfImageToTitleSpacing
                _contentEdgeInsets.left = halfImageToTitleSpacing
                _contentEdgeInsets.right = halfImageToTitleSpacing
            case .center:
                _imageEdgeInsets.left = textSize.width / 2.0
                _imageEdgeInsets.right = -textSize.width / 2.0
                _titleEdgeInsets.left = -imageSize.width / 2.0
                _titleEdgeInsets.right = imageSize.width / 2.0
                _contentEdgeInsets.left = -((imageSize.width + textSize.width) - max (imageSize.width, textSize.width)) / 2.0
                _contentEdgeInsets.right = -((imageSize.width + textSize.width) - max (imageSize.width, textSize.width)) / 2.0
            case .unset:
                break
            }

            _contentEdgeInsets.top += extraContentEdgeInsets.top
            _contentEdgeInsets.bottom += extraContentEdgeInsets.bottom
            _contentEdgeInsets.left += extraContentEdgeInsets.left
            _contentEdgeInsets.right += extraContentEdgeInsets.right

            _imageEdgeInsets.top += extraImageEdgeInsets.top
            _imageEdgeInsets.bottom += extraImageEdgeInsets.bottom
            _imageEdgeInsets.left += extraImageEdgeInsets.left
            _imageEdgeInsets.right += extraImageEdgeInsets.right

            _titleEdgeInsets.top += extraTitleEdgeInsets.top
            _titleEdgeInsets.bottom += extraTitleEdgeInsets.bottom
            _titleEdgeInsets.left += extraTitleEdgeInsets.left
            _titleEdgeInsets.right += extraTitleEdgeInsets.right

            super.imageEdgeInsets = _imageEdgeInsets
            super.titleEdgeInsets = _titleEdgeInsets
            super.contentEdgeInsets = _contentEdgeInsets

        } else {
            super.imageEdgeInsets = extraImageEdgeInsets
            super.titleEdgeInsets = extraTitleEdgeInsets
            super.contentEdgeInsets = extraContentEdgeInsets
        }

        super.layoutSubviews()
    }
}
