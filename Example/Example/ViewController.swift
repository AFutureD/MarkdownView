//
//  ViewController.swift
//  Example
//
//  Created by Huanan on 2025/12/22.
//

import UIKit
import Markdown

let markdown_demo_text = """
    ---
    __Advertisement :)__
    
    - __[pica](https://nodeca.github.io/pica/demo/)__ - high quality and fast image
    resize in browser.
    - __[babelfish](https://github.com/nodeca/babelfish/)__ - developer friendly
    i18n with plurals support and easy syntax.
    
    You will like those projects!
    
    ---
    
    # h1 Heading 8-)
    ## h2 Heading
    ### h3 Heading
    #### h4 Heading
    ##### h5 Heading
    ###### h6 Heading
    
    
    ## Horizontal Rules
    
    ___
    
    ---
    
    ***
    
    
    ## Typographic replacements
    
    Enable typographer option to see result.
    
    (c) (C) (r) (R) (tm) (TM) (p) (P) +-
    
    test.. test... test..... test?..... test!....
    
    !!!!!! ???? ,,  -- ---
    
    "Smartypants, double quotes" and 'single quotes'
    
    
    ## Emphasis
    
    **This is bold text**
    
    __This is bold text__
    
    *This is italic text*
    
    _This is italic text_
    
    ~~Strikethrough~~
    
    
    ## Blockquotes
    
    
    > Blockquotes can also be nested...
    >> ...by using additional greater-than signs right next to each other...
    > > > ...or with spaces between arrows.
    
    
    ## Lists
    
    Unordered
    
    + Create a list by starting a line with `+`, `-`, or `*`
    + Sub-lists are made by indenting 2 spaces:
    - Marker character change forces new list start:
    * Ac tristique libero volutpat at
    + Facilisis in pretium nisl aliquet
    - Nulla volutpat aliquam velit
    + Very easy!
    
    Ordered
    
    1. Lorem ipsum dolor sit amet
    2. Consectetur adipiscing elit
    3. Integer molestie lorem at massa
    
    
    1. You can use sequential numbers...
    1. ...or keep all the numbers as `1.`
    
    Start numbering with offset:
    
    57. foo
    1. bar
    
    
    ## Code
    
    Inline `code`
    
    Indented code
    
    // Some comments
    line 1 of code
    line 2 of code
    line 3 of code
    
    
    Block code "fences"
    
    ```
    Sample text here...
    ```
    
    Syntax highlighting
    
    ``` js
    var foo = function (bar) {
    return bar++;
    };
    
    console.log(foo(5));
    ```
    
    ## Tables
    
    | Option | Description |
    | ------ | ----------- |
    | data   | path to data files to supply the data that will be passed into templates. |
    | engine | engine to be used for processing templates. Handlebars is the default. |
    | ext    | extension to be used for dest files. |
    
    Right aligned columns
    
    | Option | Description |
    | ------:| -----------:|
    | data   | path to data files to supply the data that will be passed into templates. |
    | engine | engine to be used for processing templates. Handlebars is the default. |
    | ext    | extension to be used for dest files. |
    
    
    ## Links
    
    [link text](http://dev.nodeca.com)
    
    [link with title](http://nodeca.github.io/pica/demo/ "title text!")
    
    Autoconverted link https://github.com/nodeca/pica (enable linkify to see)
    
    
    ## Images
    
    ![Minion](https://octodex.github.com/images/minion.png)
    ![Stormtroopocat](https://octodex.github.com/images/stormtroopocat.jpg "The Stormtroopocat")
    
    Like links, Images also have a footnote style syntax
    
    ![Alt text][id]
    
    With a reference later in the document defining the URL location:
    
    [id]: https://octodex.github.com/images/dojocat.jpg  "The Dojocat"
    
    
    ## Plugins
    
    The killer feature of `markdown-it` is very effective support of
    [syntax plugins](https://www.npmjs.org/browse/keyword/markdown-it-plugin).
    
    
    ### [Emojies](https://github.com/markdown-it/markdown-it-emoji)
    
    > Classic markup: :wink: :cry: :laughing: :yum:
    >
    > Shortcuts (emoticons): :-) :-( 8-) ;)
    
    see [how to change output](https://github.com/markdown-it/markdown-it-emoji#change-output) with twemoji.
    
    
    ### [Subscript](https://github.com/markdown-it/markdown-it-sub) / [Superscript](https://github.com/markdown-it/markdown-it-sup)
    
    - 19^th^
    - H~2~O
    
    
    ### [<ins>](https://github.com/markdown-it/markdown-it-ins)
    
    ++Inserted text++
    
    
    ### [<mark>](https://github.com/markdown-it/markdown-it-mark)
    
    ==Marked text==
    
    
    ### [Footnotes](https://github.com/markdown-it/markdown-it-footnote)
    
    Footnote 1 link[^first].
    
    Footnote 2 link[^second].
    
    Inline footnote^[Text of inline footnote] definition.
    
    Duplicated footnote reference[^second].
    
    [^first]: Footnote **can have markup**
    
    and multiple paragraphs.
    
    [^second]: Footnote text.
    
    
    ### [Definition lists](https://github.com/markdown-it/markdown-it-deflist)
    
    Term 1
    
    :   Definition 1
    with lazy continuation.
    
    Term 2 with *inline markup*
    
    :   Definition 2
    
        { some code, part of Definition 2 }
    
    Third paragraph of definition 2.
    
    _Compact style:_
    
    Term 1
    ~ Definition 1
    
    Term 2
    ~ Definition 2a
    ~ Definition 2b
    
    
    ### [Abbreviations](https://github.com/markdown-it/markdown-it-abbr)
    
    This is HTML abbreviation example.
    
    It converts "HTML", but keep intact partial entries like "xxxHTMLyyy" and so on.
    
    *[HTML]: Hyper Text Markup Language
    
    ### [Custom containers](https://github.com/markdown-it/markdown-it-container)
    
    ::: warning
    *here be dragons*
    :::

    """

class TextStorage: NSTextStorage {}

class TextContentStorage: NSTextContentStorage {
//    var store: TextStorage? = .init()
//
//    override var attributedString: NSAttributedString? {
//        get {
//            store
//        }
//        set {
//
//        }
//    }

    override func enumerateTextElements(from textLocation: (any NSTextLocation)?, options: NSTextContentManager.EnumerationOptions = [], using block: (NSTextElement) -> Bool) -> (any NSTextLocation)? {
        super.enumerateTextElements(from: textLocation, options: options) {
            return block($0)
        }
    }

    override func performEditingTransaction(_ transaction: () -> Void) {
        super.performEditingTransaction(transaction)
    }


    override func textElements(for range: NSTextRange) -> [NSTextElement] {
        let ret = super.textElements(for: range)
        return ret
    }

    override func replaceContents(in range: NSTextRange, with textElements: [NSTextElement]?) {
        print("\(range) - \(textElements ?? [])")
        super.replaceContents(in: range, with: textElements)
        print("\(range) - \(textElements ?? [])")
    }

    override func textElement(for attributedString: NSAttributedString) -> NSTextElement? {
        let ret = super.textElement(for: attributedString)
        print("\(attributedString) -> \(ret, default: "nil")")
        return ret
    }
}

class ViewController: UIViewController, NSTextContentStorageDelegate, NSTextStorageDelegate, NSTextLayoutManagerDelegate {
    var textView: UITextView!

    let textContainer = NSTextContainer()
    let textContentManager = MarkdownContentStorage()
    let layoutManager = NSTextLayoutManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6

        layoutManager.textContainer = textContainer
        textContentManager.addTextLayoutManager(layoutManager)

        textView = UITextView(frame: .zero, textContainer: textContainer)


        view.addSubview(textView)
        textView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            textView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            textView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            textView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])

        var visitor = Markdownosaur()
        let doc = Document(parsing: String(markdown_demo_text))
        let att = doc.accept(&visitor)
//        textView.attributedText = att

        textContentManager.performEditingTransaction {
            self.textView.textStorage.setAttributedString(att)
        }

        textContentManager.textStorage

//        textView.textStorage.setAttributedString(att)

//        textContentManager.performEditingTransaction {
//
//        }
//        Task {
//            for _ in 1 ... 1000 {
//                print("==========")
//                let start = ProcessInfo.processInfo.systemUptime
//
//                let doc = Document(parsing: String(markdown_demo_text.shuffled()))
//                let att = doc.accept(&visitor)
//                textView.attributedText = att
//
//                let end = ProcessInfo.processInfo.systemUptime
//                print("update \((end - start) * 1000)")
//                print("==========")
//
//                try await Task.sleep(nanoseconds: 167_000_000)
//            }
//        }


    }

//    func textContentManager(_ textContentManager: NSTextContentManager, textElementAt location: any NSTextLocation) -> NSTextElement? {
//        nil
//    }

    func textContentManager(_ textContentManager: NSTextContentManager, shouldEnumerate textElement: NSTextElement, options: NSTextContentManager.EnumerationOptions = []) -> Bool {
        true
    }

    func textContentStorage(_ textContentStorage: NSTextContentStorage, textParagraphWith range: NSRange) -> NSTextParagraph? {
        nil
//        let originalText = textContentStorage.textStorage!.attributedSubstring(from: range)
//
////        if !originalText.string.starts(with: "# ") {
////            return nil
////        }
//        guard let range = originalText.string.range(of: "# ") else {
//            return nil
//        }
//
//        let new = NSMutableAttributedString(attributedString: originalText)
//        new.replaceCharacters(in: NSRange(range, in: originalText.string), with: "")
//        
//        return NSTextParagraph(attributedString: new)
    }

    func textStorage(_ textStorage: NSTextStorage, didProcessEditing editedMask: NSTextStorage.EditActions, range editedRange: NSRange, changeInLength delta: Int) {
        print(" ==========")
        print("didProcessEditing \(editedMask) \(editedRange) \(delta)")
        print("\(textStorage)")
        print(" ==========")
    }

    func textStorage(_ textStorage: NSTextStorage, willProcessEditing editedMask: NSTextStorage.EditActions, range editedRange: NSRange, changeInLength delta: Int) {
//        print("willProcessEditing \(editedMask) \(editedRange) \(delta)")
//        print("\(textStorage)")
    }
}

public struct Markdownosaur: MarkupVisitor {
    let baseFontSize: CGFloat = 15.0

    public init() {}

    public mutating func attributedString(from document: Document) -> NSAttributedString {
        return visit(document)
    }

    mutating public func defaultVisit(_ markup: Markup) -> NSAttributedString {
        let result = NSMutableAttributedString()

        for child in markup.children {
            result.append(visit(child))
        }

        return result
    }

    mutating public func visitText(_ text: Text) -> NSAttributedString {
        return NSAttributedString(string: text.plainText, attributes: [.font: UIFont.systemFont(ofSize: baseFontSize, weight: .regular)])
    }

    mutating public func visitEmphasis(_ emphasis: Emphasis) -> NSAttributedString {
        let result = NSMutableAttributedString()

        for child in emphasis.children {
            result.append(visit(child))
        }

        result.applyEmphasis()

        return result
    }

    mutating public func visitStrong(_ strong: Strong) -> NSAttributedString {
        let result = NSMutableAttributedString()

        for child in strong.children {
            result.append(visit(child))
        }

        result.applyStrong()

        return result
    }

    mutating public func visitParagraph(_ paragraph: Paragraph) -> NSAttributedString {
        let result = NSMutableAttributedString()

        for child in paragraph.children {
            result.append(visit(child))
        }

        if paragraph.hasSuccessor {
            result.append(paragraph.isContainedInList ? .singleNewline(withFontSize: baseFontSize) : .doubleNewline(withFontSize: baseFontSize))
        }

        return result
    }

    mutating public func visitHeading(_ heading: Heading) -> NSAttributedString {
        let result = NSMutableAttributedString()

        for child in heading.children {
            result.append(visit(child))
        }

        result.applyHeading(withLevel: heading.level)

        if heading.hasSuccessor {
            result.append(.doubleNewline(withFontSize: baseFontSize))
        }

        return result
    }

    mutating public func visitLink(_ link: Link) -> NSAttributedString {
        let result = NSMutableAttributedString()

        for child in link.children {
            result.append(visit(child))
        }

        let url = link.destination != nil ? URL(string: link.destination!) : nil

        result.applyLink(withURL: url)

        return result
    }

    mutating public func visitInlineCode(_ inlineCode: InlineCode) -> NSAttributedString {
        return NSAttributedString(string: inlineCode.code, attributes: [.font: UIFont.monospacedSystemFont(ofSize: baseFontSize - 1.0, weight: .regular), .foregroundColor: UIColor.systemGray])
    }

    public func visitCodeBlock(_ codeBlock: CodeBlock) -> NSAttributedString {
        let result = NSMutableAttributedString(string: codeBlock.code, attributes: [.font: UIFont.monospacedSystemFont(ofSize: baseFontSize - 1.0, weight: .regular), .foregroundColor: UIColor.systemGray])

        if codeBlock.hasSuccessor {
            result.append(.singleNewline(withFontSize: baseFontSize))
        }

        return result
    }

    mutating public func visitStrikethrough(_ strikethrough: Strikethrough) -> NSAttributedString {
        let result = NSMutableAttributedString()

        for child in strikethrough.children {
            result.append(visit(child))
        }

        result.applyStrikethrough()

        return result
    }

    mutating public func visitUnorderedList(_ unorderedList: UnorderedList) -> NSAttributedString {
        let result = NSMutableAttributedString()

        let font = UIFont.systemFont(ofSize: baseFontSize, weight: .regular)

        for listItem in unorderedList.listItems {
            var listItemAttributes: [NSAttributedString.Key: Any] = [:]

            let listItemParagraphStyle = NSMutableParagraphStyle()

            let baseLeftMargin: CGFloat = 15.0
            let leftMarginOffset = baseLeftMargin + (20.0 * CGFloat(unorderedList.listDepth))
            let spacingFromIndex: CGFloat = 8.0
            let bulletWidth = ceil(NSAttributedString(string: "•", attributes: [.font: font]).size().width)
            let firstTabLocation = leftMarginOffset + bulletWidth
            let secondTabLocation = firstTabLocation + spacingFromIndex

            listItemParagraphStyle.tabStops = [
                NSTextTab(textAlignment: .right, location: firstTabLocation),
                NSTextTab(textAlignment: .left, location: secondTabLocation)
            ]

            listItemParagraphStyle.headIndent = secondTabLocation

            listItemAttributes[.paragraphStyle] = listItemParagraphStyle
            listItemAttributes[.font] = UIFont.systemFont(ofSize: baseFontSize, weight: .regular)
            listItemAttributes[.listDepth] = unorderedList.listDepth

            let listItemAttributedString = visit(listItem).mutableCopy() as! NSMutableAttributedString
            listItemAttributedString.insert(NSAttributedString(string: "\t•\t", attributes: listItemAttributes), at: 0)

            result.append(listItemAttributedString)
        }

        if unorderedList.hasSuccessor {
            result.append(.doubleNewline(withFontSize: baseFontSize))
        }

        return result
    }

    mutating public func visitListItem(_ listItem: ListItem) -> NSAttributedString {
        let result = NSMutableAttributedString()

        for child in listItem.children {
            result.append(visit(child))
        }

        if listItem.hasSuccessor {
            result.append(.singleNewline(withFontSize: baseFontSize))
        }

        return result
    }

    mutating public func visitOrderedList(_ orderedList: OrderedList) -> NSAttributedString {
        let result = NSMutableAttributedString()

        for (index, listItem) in orderedList.listItems.enumerated() {
            var listItemAttributes: [NSAttributedString.Key: Any] = [:]

            let font = UIFont.systemFont(ofSize: baseFontSize, weight: .regular)
            let numeralFont = UIFont.monospacedDigitSystemFont(ofSize: baseFontSize, weight: .regular)

            let listItemParagraphStyle = NSMutableParagraphStyle()

            // Implement a base amount to be spaced from the left side at all times to better visually differentiate it as a list
            let baseLeftMargin: CGFloat = 15.0
            let leftMarginOffset = baseLeftMargin + (20.0 * CGFloat(orderedList.listDepth))

            // Grab the highest number to be displayed and measure its width (yes normally some digits are wider than others but since we're using the numeral mono font all will be the same width in this case)
            let highestNumberInList = orderedList.childCount
            let numeralColumnWidth = ceil(NSAttributedString(string: "\(highestNumberInList).", attributes: [.font: numeralFont]).size().width)

            let spacingFromIndex: CGFloat = 8.0
            let firstTabLocation = leftMarginOffset + numeralColumnWidth
            let secondTabLocation = firstTabLocation + spacingFromIndex

            listItemParagraphStyle.tabStops = [
                NSTextTab(textAlignment: .right, location: firstTabLocation),
                NSTextTab(textAlignment: .left, location: secondTabLocation)
            ]

            listItemParagraphStyle.headIndent = secondTabLocation

            listItemAttributes[.paragraphStyle] = listItemParagraphStyle
            listItemAttributes[.font] = font
            listItemAttributes[.listDepth] = orderedList.listDepth

            let listItemAttributedString = visit(listItem).mutableCopy() as! NSMutableAttributedString

            // Same as the normal list attributes, but for prettiness in formatting we want to use the cool monospaced numeral font
            var numberAttributes = listItemAttributes
            numberAttributes[.font] = numeralFont

            let numberAttributedString = NSAttributedString(string: "\t\(index + 1).\t", attributes: numberAttributes)
            listItemAttributedString.insert(numberAttributedString, at: 0)

            result.append(listItemAttributedString)
        }

        if orderedList.hasSuccessor {
            result.append(orderedList.isContainedInList ? .singleNewline(withFontSize: baseFontSize) : .doubleNewline(withFontSize: baseFontSize))
        }

        return result
    }

    mutating public func visitBlockQuote(_ blockQuote: BlockQuote) -> NSAttributedString {
        let result = NSMutableAttributedString()

        for child in blockQuote.children {
            var quoteAttributes: [NSAttributedString.Key: Any] = [:]

            let quoteParagraphStyle = NSMutableParagraphStyle()

            let baseLeftMargin: CGFloat = 15.0
            let leftMarginOffset = baseLeftMargin + (20.0 * CGFloat(blockQuote.quoteDepth))

            quoteParagraphStyle.tabStops = [NSTextTab(textAlignment: .left, location: leftMarginOffset)]

            quoteParagraphStyle.headIndent = leftMarginOffset

            quoteAttributes[.paragraphStyle] = quoteParagraphStyle
            quoteAttributes[.font] = UIFont.systemFont(ofSize: baseFontSize, weight: .regular)
            quoteAttributes[.listDepth] = blockQuote.quoteDepth

            let quoteAttributedString = visit(child).mutableCopy() as! NSMutableAttributedString
            quoteAttributedString.insert(NSAttributedString(string: "\t", attributes: quoteAttributes), at: 0)

            quoteAttributedString.addAttribute(.foregroundColor, value: UIColor.systemGray)

            result.append(quoteAttributedString)
        }

        if blockQuote.hasSuccessor {
            result.append(.doubleNewline(withFontSize: baseFontSize))
        }

        return result
    }
}

// MARK: - Extensions Land

extension NSMutableAttributedString {
    func applyEmphasis() {
        enumerateAttribute(.font, in: NSRange(location: 0, length: length), options: []) { value, range, stop in
            guard let font = value as? UIFont else { return }

            let newFont = font.apply(newTraits: .traitItalic)
            addAttribute(.font, value: newFont, range: range)
        }
    }

    func applyStrong() {
        enumerateAttribute(.font, in: NSRange(location: 0, length: length), options: []) { value, range, stop in
            guard let font = value as? UIFont else { return }

            let newFont = font.apply(newTraits: .traitBold)
            addAttribute(.font, value: newFont, range: range)
        }
    }

    func applyLink(withURL url: URL?) {
        addAttribute(.foregroundColor, value: UIColor.systemBlue)

        if let url = url {
            addAttribute(.link, value: url)
        }
    }

    func applyBlockquote() {
        addAttribute(.foregroundColor, value: UIColor.systemGray)
    }

    func applyHeading(withLevel headingLevel: Int) {
        enumerateAttribute(.font, in: NSRange(location: 0, length: length), options: []) { value, range, stop in
            guard let font = value as? UIFont else { return }

            let newFont = font.apply(newTraits: .traitBold, newPointSize: 28.0 - CGFloat(headingLevel * 2))
            addAttribute(.font, value: newFont, range: range)
        }
    }

    func applyStrikethrough() {
        addAttribute(.strikethroughStyle, value: NSUnderlineStyle.single.rawValue)
    }
}

extension UIFont {
    func apply(newTraits: UIFontDescriptor.SymbolicTraits, newPointSize: CGFloat? = nil) -> UIFont {
        var existingTraits = fontDescriptor.symbolicTraits
        existingTraits.insert(newTraits)

        guard let newFontDescriptor = fontDescriptor.withSymbolicTraits(existingTraits) else { return self }
        return UIFont(descriptor: newFontDescriptor, size: newPointSize ?? pointSize)
    }
}

extension ListItemContainer {
    /// Depth of the list if nested within others. Index starts at 0.
    var listDepth: Int {
        var index = 0

        var currentElement = parent

        while currentElement != nil {
            if currentElement is ListItemContainer {
                index += 1
            }

            currentElement = currentElement?.parent
        }

        return index
    }
}

extension BlockQuote {
    /// Depth of the quote if nested within others. Index starts at 0.
    var quoteDepth: Int {
        var index = 0

        var currentElement = parent

        while currentElement != nil {
            if currentElement is BlockQuote {
                index += 1
            }

            currentElement = currentElement?.parent
        }

        return index
    }
}

extension NSAttributedString.Key {
    static let listDepth = NSAttributedString.Key("ListDepth")
    static let quoteDepth = NSAttributedString.Key("QuoteDepth")
}

extension NSMutableAttributedString {
    func addAttribute(_ name: NSAttributedString.Key, value: Any) {
        addAttribute(name, value: value, range: NSRange(location: 0, length: length))
    }

    func addAttributes(_ attrs: [NSAttributedString.Key : Any]) {
        addAttributes(attrs, range: NSRange(location: 0, length: length))
    }
}

extension Markup {
    /// Returns true if this element has sibling elements after it.
    var hasSuccessor: Bool {
        guard let childCount = parent?.childCount else { return false }
        return indexInParent < childCount - 1
    }

    var isContainedInList: Bool {
        var currentElement = parent

        while currentElement != nil {
            if currentElement is ListItemContainer {
                return true
            }

            currentElement = currentElement?.parent
        }

        return false
    }
}

extension NSAttributedString {
    static func singleNewline(withFontSize fontSize: CGFloat) -> NSAttributedString {
        return NSAttributedString(string: "\n", attributes: [.font: UIFont.systemFont(ofSize: fontSize, weight: .regular)])
    }

    static func doubleNewline(withFontSize fontSize: CGFloat) -> NSAttributedString {
        return NSAttributedString(string: "\n\n", attributes: [.font: UIFont.systemFont(ofSize: fontSize, weight: .regular)])
    }
}
