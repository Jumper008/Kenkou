//
//  FoodItem.m
//  Kenkou
//
//  Created by Nelly on 22/11/15.
//  Copyright © 2015 Lazuli Labs. All rights reserved.
//

#import "FoodItem.h"

@implementation FoodItem

+ (id)foodItemOfName:(NSString *)sName IsFruitOrVeggie:(BOOL)bFruitOrVeggie IsCereal:(BOOL)bCereal IsSugar:(BOOL)bSugar IsFat:(BOOL)bFat IsCalciumRich:(BOOL)bCalciumRich
{
    FoodItem *fooditemToAdd = [[self alloc] init];
    fooditemToAdd.strName = sName;
    fooditemToAdd.bFruitOrVegetable = bFruitOrVeggie;
    fooditemToAdd.bCereal = bCereal;
    fooditemToAdd.bSugar = bSugar;
    fooditemToAdd.bFat = bFat;
    fooditemToAdd.bCalciumRich = bCalciumRich;
    
    return fooditemToAdd;
}

@end
