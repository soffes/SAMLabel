//
//  SAMLabel.m
//  SAMLabel
//
//  Created by Sam Soffes on 7/12/10.
//  Copyright 2010-2013 Sam Soffes. All rights reserved.
//

#import "SAMLabel.h"

@implementation SAMLabel

#pragma mark - Accessors

- (void)setVerticalTextAlignment:(SAMLabelVerticalTextAlignment)verticalTextAlignment {
	_verticalTextAlignment = verticalTextAlignment;

	[self setNeedsLayout];
}


- (void)setTextEdgeInsets:(UIEdgeInsets)textEdgeInsets {
	_textEdgeInsets = textEdgeInsets;

	[self setNeedsLayout];
}


#pragma mark - UIView

- (id)initWithCoder:(NSCoder *)aDecoder {
	if ((self = [super initWithCoder:aDecoder])) {
        self.verticalTextAlignment = SAMLabelVerticalTextAlignmentMiddle;
	}
	return self;
}


- (id)initWithFrame:(CGRect)aFrame {
	if ((self = [super initWithFrame:aFrame])) {
        self.verticalTextAlignment = SAMLabelVerticalTextAlignmentMiddle;
	}
	return self;
}


#pragma mark - UILabel

- (void)drawTextInRect:(CGRect)rect {
	rect = UIEdgeInsetsInsetRect(rect, self.textEdgeInsets);

	if (self.verticalTextAlignment == SAMLabelVerticalTextAlignmentTop) {
		CGSize sizeThatFits = [self sizeThatFits:rect.size];
		rect = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, sizeThatFits.height);
	} else if (self.verticalTextAlignment == SAMLabelVerticalTextAlignmentBottom) {
		CGSize sizeThatFits = [self sizeThatFits:rect.size];
		rect = CGRectMake(rect.origin.x, rect.origin.y + (rect.size.height - sizeThatFits.height), rect.size.width, sizeThatFits.height);
	}

	[super drawTextInRect:rect];
}

- (CGSize)intrinsicContentSize {
    CGSize size = [super intrinsicContentSize];
    return CGSizeMake(size.width + self.textEdgeInsets.left + self.textEdgeInsets.right, size.height + self.textEdgeInsets.top + self.textEdgeInsets.bottom);
}


@end
