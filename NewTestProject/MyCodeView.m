//
//  MyCodeView.m
//  NewTestProject
//
//  Created by 严若鹏 on 15/8/19.
//  Copyright (c) 2015年 严若鹏. All rights reserved.
//

#import "MyCodeView.h"

@implementation MyCodeView

- (void)drawRect:(CGRect)rect
{
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }

    // @name 生成背景色
    float red = arc4random() % 100 / 100.0;
    float green = arc4random() % 100 / 100.0;
    float blue = arc4random() % 100 / 100.0;
    UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:0.2];
    [self setBackgroundColor:color];
    
    // @name 随机生成验证码
    const int count = 5;
    char data[count];
    for (int x = 0; x < count; x++) {
        int j = '0' + (arc4random_uniform(75));
        if((j >= 58 && j <= 64) || (j >= 91 && j <= 96)){
            --x;
        }else{
            data[x] = (char)j;
        }
    }
    NSString *text = [[NSString alloc] initWithBytes:data
                                              length:count encoding:NSUTF8StringEncoding];
    
    CGSize cSize = [@"S" sizeWithFont:[UIFont systemFontOfSize:16]];
    int width = self.frame.size.width / text.length - cSize.width;
    int height = self.frame.size.height - cSize.height;
    
    
    NSAssert((width>0&&height>0), @"The BG size is too small,please check and change it to right!!!");
    
    
    CGPoint point;
    float pX = 0.0, pY = 0.0;
    for (int i = 0; i < count; i++) {
        pX = arc4random() % width + self.frame.size.width / count * i - 1;
        pY = arc4random() % height;
        point = CGPointMake(pX, pY);
        unichar c = [text characterAtIndex:i];
        UILabel *tempLabel = [[UILabel alloc]
                              initWithFrame:CGRectMake(pX, pY,
                                                       self.frame.size.width / count,
                                                       cSize.height)];
        tempLabel.backgroundColor = [UIColor clearColor];
        
        // 字体颜色
        float red = arc4random() % 100 / 100.0;
        float green = arc4random() % 100 / 100.0;
        float blue = arc4random() % 100 / 100.0;
        UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
        
        NSString *textC = [NSString stringWithFormat:@"%C", c];
        tempLabel.textColor = color;
        tempLabel.text = textC;
        [self addSubview:tempLabel];
    }
    
    // 干扰线
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1.0);
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    CGContextSetAllowsAntialiasing(context, YES);
    for(int i = 0; i < count; i++) {
        red = arc4random() % 100 / 100.0;
        green = arc4random() % 100 / 100.0;
        blue = arc4random() % 100 / 100.0;
        color = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
        CGContextSetStrokeColorWithColor(context, [color CGColor]);
        pX = arc4random() % (int)self.frame.size.width;
        pY = arc4random() % (int)self.frame.size.height;
        CGContextMoveToPoint(context, pX, pY);
        pX = arc4random() % (int)self.frame.size.width;
        pY = arc4random() % (int)self.frame.size.height;
        CGContextAddLineToPoint(context, pX, pY);
        CGContextStrokePath(context);
    }
}
@end
