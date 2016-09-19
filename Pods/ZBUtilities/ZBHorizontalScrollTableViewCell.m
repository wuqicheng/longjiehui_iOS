//
//  ZBHorizontalScrollTableViewCell.m
//  dushuhu
//
//  Created by zhangbin on 3/26/14.
//  Copyright (c) 2014 zoombin. All rights reserved.
//

#import "ZBHorizontalScrollTableViewCell.h"

#define kAutoScrollTimeInterval 5.0

@interface ZBHorizontalScrollTableViewCell () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, assign) NSUInteger currentPage;
@property (nonatomic, strong) NSArray *contentViews;

@end

@implementation ZBHorizontalScrollTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
		_scrollView = [[UIScrollView alloc] init];
		_scrollView.delegate = self;
		_scrollView.showsHorizontalScrollIndicator = NO;
		_scrollView.showsVerticalScrollIndicator = NO;
		[self addSubview:_scrollView];
    }
    return self;
}

- (void)setAutoScrollEnabled:(BOOL)autoScrollEnabled
{
	if (_autoScrollEnabled == autoScrollEnabled) return;
	_autoScrollEnabled = autoScrollEnabled;
	if (_autoScrollEnabled) {
		_scrollView.pagingEnabled = YES;
		[self performSelector:@selector(scrollToNext) withObject:nil afterDelay:kAutoScrollTimeInterval];
	}
}

- (void)reloadData
{
	CGFloat height = [_delegate heightForCell:self inSection:_section];
	CGRect frame = self.bounds;
	frame.size.height = height;
	_scrollView.frame = frame;

	for (UIView *sView in _contentViews) {
		[sView removeFromSuperview];
	}
	_contentViews = nil;
	
	NSInteger numberOfColumns = [_delegate numberOfColumnsForCell:self inSection:_section];
	
	CGFloat contentWidth = 0.0;
	for (int i = 0; i < numberOfColumns; i++) {
		UIView *contentView = [_delegate horizontalScrollTableViewCell:self contentViewForColumnAtIndex:i inSection:_section];
		contentWidth += contentView.frame.size.width;
		[_scrollView addSubview:contentView];
	}
	_contentViews = _scrollView.subviews;
	_scrollView.contentSize = CGSizeMake(contentWidth, height);
}

- (void)scrollToNext
{
	_currentPage++;
	NSInteger numberOfColumns = [_delegate numberOfColumnsForCell:self inSection:_section];
	if (_currentPage > numberOfColumns - 1) {
		[_scrollView setContentOffset:CGPointZero animated:YES];
		_currentPage = 0;
	} else {
		[_scrollView setContentOffset:CGPointMake(_currentPage * _scrollView.frame.size.width, 0) animated:YES];
	}
	[self performSelector:@selector(scrollToNext) withObject:nil afterDelay:kAutoScrollTimeInterval];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
	CGFloat pageWidth = _scrollView.frame.size.width;
	_currentPage = floor((_scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
}

@end
