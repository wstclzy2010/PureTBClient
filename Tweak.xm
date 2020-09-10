@interface TBCVitalityPBCommonTopForumTagView : UIView
@end

@interface TBCNewPBFirstFloorView
- (void)removeLiveViewWhenCloseLive;
@end

@interface TBCLaunchADViewController
- (void)skipAdButtonClick:(id)arg1;
@end



%hook NSMutableArray
//首页直播推荐
- (void)safeAddObject:(id)obj
{
	if ([obj isKindOfClass:%c(TBCFrsDataItem)]) 
	{
		if ([obj valueForKey:@"alaLiveInfo"]) 
		{
			return;
		}
		return %orig;
	}
	return %orig;
}

%end


// %hook TBClientAppDelegate
// - (void)showAd
// {
// 	TBCVipCloseADModel *pj = [%c(TBCVipCloseADModel) new];
// 	[pj closeVipAD:YES];
// }
// %end

%hook TBCPromotionItem
- (id)init
{
	return nil;
}
%end


%hook TBCHomePageHeaderView
- (id)initWithFrame:(struct CGRect)arg1
{
	return nil;
}
%end

// 去掉首页的头部广告
%hook TBCHomePageViewController

- (id)headerView {
	return nil;
}

%end


// 去掉首页 『领金币』 入口
%hook TBCChoicenessHeaderView

- (BOOL)isShowTaskEntrance
{
	return NO;
}

%end

%hook TBCNewPBFirstFloorView
//帖子内部直播推荐
- (void)setupTopBarView
{
	%orig;
	[self removeLiveViewWhenCloseLive];
}
%end

%hook FLBFlutterViewContainer
- (void)installSplashScreenViewIfNecessary
{
	return;
}
%end

%hook TBCVitalityPBCommonTopForumTagView
//帖子内部吧名介绍
- (id)initWithFrame:(struct CGRect)arg1
{
	self = %orig(CGRectZero);
	self.alpha = 0;
	return self;
}
%end

%hook TBCLaunchADViewController
//启动广告
- (void)viewDidLoad
{
	%orig;
	[self skipAdButtonClick:nil];
}
%end

