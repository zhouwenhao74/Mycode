//
//  FavoritesViewController.h
//  爱限免V5
//
//  Created by Alex on 14-5-25.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FavoritesView.h"
@interface FavoritesViewController : UIViewController<FavoritesViewDelegate>
{
    FavoritesView *_myFavoritesView;
}

@end
