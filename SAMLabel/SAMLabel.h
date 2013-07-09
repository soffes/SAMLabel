//
//  SAMLabel.h
//  SAMLabel
//
//  Created by Sam Soffes on 7/12/10.
//  Copyright 2010-2013 Sam Soffes. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 The vertical alignment of text within a label.
 */
typedef enum {
	/** Aligns the text vertically at the top in the label (the default). */
	SAMLabelVerticalTextAlignmentTop = UIControlContentVerticalAlignmentTop,

	/** Aligns the text vertically in the center of the label. */
	SAMLabelVerticalTextAlignmentMiddle = UIControlContentVerticalAlignmentCenter,

	/** Aligns the text vertically at the bottom in the label. */
	SAMLabelVerticalTextAlignmentBottom = UIControlContentVerticalAlignmentBottom
} SAMLabelVerticalTextAlignment;

/**
 Simple label subclass that adds the ability to align your text to the top or bottom.
 */
@interface SAMLabel : UILabel

/**
 The vertical text alignment of the receiver.

 The default is `SAMLabelVerticalTextAlignmentMiddle` to match `UILabel`.
 */
@property (nonatomic, assign) SAMLabelVerticalTextAlignment verticalTextAlignment;

/**
 The edge insets of the text.

 The default is `UIEdgeInsetsZero` so it behaves like `UILabel` by default.
 */
@property (nonatomic, assign) UIEdgeInsets textEdgeInsets;

@end
