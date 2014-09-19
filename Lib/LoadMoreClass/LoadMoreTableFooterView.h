/**
 *  实现上拉加载更多视图
 */
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

typedef NS_ENUM (NSUInteger,PullLoadMoreState){
	PullLoadMorePulling = 0,
	PullLoadMoreNormal,
	PullLoadMoreLoading,
} ;

@protocol LoadMoreTableFooterDelegate;

@interface LoadMoreTableFooterView : UIView {
	
	id _delegate;
	PullLoadMoreState _state;
    UILabel *_statusLabel;
	CALayer *_arrowImage;
	UIActivityIndicatorView *_activityView;
}

@property(nonatomic,assign) id <LoadMoreTableFooterDelegate> delegate;
/**
 *  初始化上拉加载更多视图
 *
 *  @param frame     上拉加载更多视图的左上角坐标，宽和高
 *  @param arrow     设置上拉加载更多的箭头图片（默认是blueArrowLoadMore.png图片，使用默认项目文件需要包含有为图片名的图片）
 *  @param textColor 设置视图字体的颜色
 *
 *  @return 返回下拉加载更多视图对象
 */
- (id)initWithFrame:(CGRect)frame arrowImageName:(NSString *)arrow textColor:(UIColor *)textColor;
/**
 *  当tableview发生滚动时候调用，判断上拉加载更多视图是处于正在加载状态，还是普通状态（上拉加载更多），提醒放开手指状态（释放立即加载更多）
 *
 *  @param scrollView 需要加载更多的tableView
 */
- (void)loadMoreScrollViewDidScroll:(UIScrollView *)scrollView;
/**
 *  当拖动tableView的手指放开的时候调用该函数
 *
 *  @param scrollView 需要加载更多的tableView
 */
- (void)loadMoreScrollViewDidEndDragging:(UIScrollView *)scrollView;
/**
 *  数据加载结束时候让上拉加载更多视图返回
 *
 *  @param scrollView  需要加载更多的tableView
 */
- (void)loadMoreScrollViewDataSourceDidFinishedLoading:(UIScrollView *)scrollView;

@end

@protocol LoadMoreTableFooterDelegate
/**
 *  通知委托加载更多
 *
 *  @param view 委托视图
 */
- (void)loadMoreTableFooterDidTriggerLoadMore:(LoadMoreTableFooterView*)view;
/**
 *  委托返回是否处于加载数据状态
 *
 *  @param view 委托视图
 *
 *  @return 是否处于加载数据状态
 */
- (BOOL)loadMoreTableFooterDataSourceIsLoading:(LoadMoreTableFooterView*)view;


@end
