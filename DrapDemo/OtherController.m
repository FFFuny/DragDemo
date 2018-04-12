//
//  OtherController.m
//  DrapDemo
//
//  Created by ios on 2018/4/12.
//  Copyright © 2018年 sf. All rights reserved.
//

#import "OtherController.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface OtherController ()
{
    CGFloat _yyy;
}

@property (weak, nonatomic) IBOutlet UITextView *topTextView;


@property (weak, nonatomic) IBOutlet UIScrollView *bottomScroll;
@property (weak, nonatomic) IBOutlet UILabel *bottomLabel;
@property (weak, nonatomic) IBOutlet UILabel *dragLabel;


@end

@implementation OtherController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addGes];
}

- (IBAction)backClick:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)addGes
{
    _topTextView.text = @"生命的结束，也许是因为一场毫无预兆的灾难，也许是因为想不开，自寻短见，可以是地球突然爆炸，还可以是生命正常的老去。作为一个人，来到世界的方法只有一个——人都是母亲身上掉下来的一块肉。但离去的方法有很多，甚至是异想天开般离去。生命的结束，也许是因为一场毫无预兆的灾难，也许是因为想不开，自寻短见，可以是地球突然爆炸，还可以是生命正常的老去。作为一个人，来到世界的方法只有一个——人都是母亲身上掉下来的一块肉。但离去的方法有很多，甚至是异想天开般离去。生命的结束，也许是因为一场毫无预兆的灾难，也许是因为想不开，自寻短见，可以是地球突然爆炸，还可以是生命正常的老去。作为一个人，来到世界的方法只有一个——人都是母亲身上掉下来的一块肉。但离去的方法有很多，甚至是异想天开般离去。生命的结束，也许是因为一场毫无预兆的灾难，也许是因为想不开，自寻短见，可以是地球突然爆炸，还可以是生命正常的老去。作为一个人，来到世界的方法只有一个——人都是母亲身上掉下来的一块肉。但离去的方法有很多，甚至是异想天开般离去。";
    
    _bottomLabel.text = @"111生命的结束，也许是因为一场毫无预兆的灾难，也许是因为想不开，自寻短见，可以是地球突然爆炸，还可以是生命正常的老去。作为一个人，来到世界的方法只有一个——人都是母亲身上掉下来的一块肉。但离去的方法有很多，甚至是异想天开般离去。生命的结束，也许是因为一场毫无预兆的灾难，也许是因为想不开，自寻短见，可以是地球突然爆炸，还可以是生命正常的老去。作为一个人，来到世界的方法只有一个——人都是母亲身上掉下来的一块肉。但离去的方法有很多，甚至是异想天开般离去。生命的结束，也许是因为一场毫无预兆的灾难，也许是因为想不开，自寻短见，可以是地球突然爆炸，还可以是生命正常的老去。作为一个人，来到世界的方法只有一个——人都是母亲身上掉下来的一块肉。但离去的方法有很多，甚至是异想天开般离去。生命的结束，也许是因为一场毫无预兆的灾难，也许是因为想不开，自寻短见，可以是地球突然爆炸，还可以是生命正常的老去。作为一个人，来到世界的方法只有一个——人都是母亲身上掉下来的一块肉。但离去的方法有很多，甚至是异想天开般离去。";
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(dragAction:)];
    [_dragLabel addGestureRecognizer:pan];
    _dragLabel.userInteractionEnabled = YES;
}

- (void)dragAction:(UIPanGestureRecognizer *)pan
{
    if (pan.state == UIGestureRecognizerStateBegan) {
        
        // 用来保存初始高度
        _yyy = CGRectGetMaxY(_topTextView.frame);
        
    } else if (pan.state == UIGestureRecognizerStateChanged) {
        
        CGPoint point = [pan translationInView:self.view];
        CGFloat y = point.y + _yyy;
        
        // 底部scrollview最小高度
        if (y > kScreenHeight - 150.0) {
            
            y = kScreenHeight - 150.0;
        }
        
        // 顶部scrollview最小高度
        if (y < 100.0) {
            
            y = 100.0;
        }
        
        // 根据拖动的位置，计算视图的高度
        self.topTextView.frame = CGRectMake(0, 0, kScreenWidth, y);
        self.dragLabel.frame = CGRectMake(0, y, kScreenWidth, 40);
        self.bottomScroll.frame = CGRectMake(0, CGRectGetMaxY(self.dragLabel.frame), kScreenWidth, kScreenHeight-y-40);
        
    } else if (pan.state == UIGestureRecognizerStateEnded) {
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
