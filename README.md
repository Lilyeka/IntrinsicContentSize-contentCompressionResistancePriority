# IntrinsicContentSize-contentCompressionResistancePriority
Here are visual formats configuring two horizontally adjacent text fields ("v1" = textField1 and "v2" = textField2) to be pinned to the superview and to one another with constraints
         "V:|-120-[v1]"
         "V:|-120-[v2]"
         "H:|-20-[v1]"
         "H:[v2]-20-|"
         "H:[v1(>=100)]-(>=20)-[v2(>=100)]"

The inequalities ensure that as the superview becomes narrower or the text of the labels becomes longer, a reasonable amount of text will remain visible in both labels. At the same time, one text field will be squeezed down to 100 points width, while the other text field will be allowed to grow to fill the remaining horizontal space. The question is: which text field is which? You need to answer that question.

To do so, it suffices to raise the compression resistance priority of one of the text field by a single point above that of the other. 

 let p = textField2.contentCompressionResistancePriority(for: .horizontal)
 textField1.setContentCompressionResistancePriority(p+1, for: .horizontal)

Play with this priority for textfields and you'll see exactly how it works.
