//
//  FoodItem.h
//  Kenkou
//
//  Created by Nelly on 22/11/15.
//  Copyright © 2015 Lazuli Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FoodItem : NSObject

@property (nonatomic, strong) NSString *strName;
@property BOOL bFruitOrVegetable;
@property BOOL bCereal;
@property BOOL bSugar;
@property BOOL bFat;
@property BOOL bCalciumRich;

+ (id)foodItemOfName:(NSString *)sName IsFruitOrVeggie:(BOOL)bFruitOrVeggie IsCereal:(BOOL)bCereal IsSugar:(BOOL)bSugar IsFat:(BOOL)bFat IsCalciumRich:(BOOL)bCalciumRich;

@end
