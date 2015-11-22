//
//  FoodTableViewController.m
//  Kenkou
//
//  Created by Alejandro Zamudio Guajardo on 11/16/15.
//  Copyright © 2015 Lazuli Labs. All rights reserved.
//

#import "FoodTableViewController.h"

@interface FoodTableViewController ()

@end

@implementation FoodTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.popUpHelp = [[PopUpViewController alloc] init];
    
    self.uibuttonSave.layer.cornerRadius = 20.0f;
    
    self.tableView.delegate = self;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    UIBarButtonItem *uibarbuttonitemRightButton =
    [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"info"] style:UIBarButtonItemStylePlain target:self action:@selector(showInfoPopUp)];
    self.tabBarController.navigationItem.rightBarButtonItem = uibarbuttonitemRightButton;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger nsintNumberOfRows;
    if (
        section == 0
        )
    {
        nsintNumberOfRows = 10;
    }
    else
    {
        nsintNumberOfRows = 2;
    }
    
    return nsintNumberOfRows;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Help buttons

- (IBAction)helpFruitsAndVegetables:(UIButton *)sender
{
    self.popUpHelp.title = @"Frutas y Verduras";
    NSString *strTitle = @"Incluir gran variedad de frutas y verduras";
    NSString *strBody = @"Seleccionar distintos colores en las frutas y verduras, ampliar la selección, elegir aquellas que no consumes regularmente.";
    
    [self.popUpHelp showInView:self.view image:sender.currentBackgroundImage title:strTitle message:strBody animated:YES];
    
    [self.popUpHelp assignScrollingDelegate:self];
    
    self.tableView.scrollEnabled = NO;
}

- (IBAction)helpCereals:(UIButton *)sender
{
    self.popUpHelp.title = @"Cereales Integrales";
    NSString *strTitle = @"Elegir cereales integrales";
    NSString *strBody = @"Al menos la mitad de los cereales que se consumen al día sean de grano entero y ricos en fibra.";
    
    [self.popUpHelp showInView:self.view image:sender.currentBackgroundImage title:strTitle message:strBody animated:YES];
    
    [self.popUpHelp assignScrollingDelegate:self];
    
    self.tableView.scrollEnabled = NO;
}

- (IBAction)helpSugars:(UIButton *)sender
{
    self.popUpHelp.title = @"Cereales y Azúcares";
    NSString *strTitle = @"Consumir cereales y azúcares con inteligencia";
    NSString *strBody = @"Endulzar las bebidas con cantidades pequeñas de azúcar o con endulzantes no calóricos, evitar las harinas refinadas sobre todo aquellas de repostería.";
    
    [self.popUpHelp showInView:self.view image:sender.currentBackgroundImage title:strTitle message:strBody animated:YES];
    
    [self.popUpHelp assignScrollingDelegate:self];
    
    self.tableView.scrollEnabled = NO;
}

- (IBAction)helpFats:(UIButton *)sender
{
    self.popUpHelp.title = @"Grasas";
    NSString *strTitle = @"Elegir grasas con inteligencia";
    NSString *strBody = @"Consumir cantidades moderadas de grasa saturada, trans y colesterol (carnes rojas, mantecas, mantequillas) Preferir el uso de grasas mono y poliinsaturadas: cortes de carne bajos en grasa, pollo sin piel, pescado y grasas de origen vegetal como nueces, almendras, cacahuates y aguacate.";
    
    [self.popUpHelp showInView:self.view image:sender.currentBackgroundImage title:strTitle message:strBody animated:YES];
    
    [self.popUpHelp assignScrollingDelegate:self];
    
    self.tableView.scrollEnabled = NO;
}

- (IBAction)helpCalcium:(UIButton *)sender
{
    self.popUpHelp.title = @"Calcio";
    NSString *strTitle = @"Consumir alimentos ricos en calcio";
    NSString *strBody = @"Incluir al menos 3 alimentos ricos en calcio cada día (yogurt, quesos, leche).";
    
    [self.popUpHelp showInView:self.view image:sender.currentBackgroundImage title:strTitle message:strBody animated:YES];
    
    [self.popUpHelp assignScrollingDelegate:self];
    
    self.tableView.scrollEnabled = NO;
}

- (IBAction)helpSalts:(UIButton *)sender
{
    self.popUpHelp.title = @"Poca Sal";
    NSString *strTitle = @"Elegir y preparar los alimentos con poca sal";
    NSString *strBody = @"Consumir menos de 5 gr. de sal al día (2.4 gr de sodio, revisa las etiquetas de los alimentos para conocer su contenido de este mineral).";
    
    [self.popUpHelp showInView:self.view image:sender.currentBackgroundImage title:strTitle message:strBody animated:YES];
    
    [self.popUpHelp assignScrollingDelegate:self];
    
    self.tableView.scrollEnabled = NO;
}

- (IBAction)helpWater:(UIButton *)sender
{
    self.popUpHelp.title = @"Agua Natural";
    NSString *strTitle = @"Beber agua natural";
    NSString *strBody = @"Consumir agua natural todos los días según las necesidades individuales.";
    
    [self.popUpHelp showInView:self.view image:sender.currentBackgroundImage title:strTitle message:strBody animated:YES];
    
    [self.popUpHelp assignScrollingDelegate:self];
    
    self.tableView.scrollEnabled = NO;
}

- (IBAction)helpEatingResponsibly1:(UIButton *)sender
{
    self.popUpHelp.title = @"Comer con Responsabilidad";
    NSString *strTitle = @"Consumir por nutrición, no por emoción";
    NSString *strBody = @"Identificar las señales de hambre y saciedad. Iniciar a comer por necesidad física y no por señales externas como ansiedad. Decidir parar de comer cuando se esta satisfecho, no ignorar el mensaje de estar satisfecho.";
    
    [self.popUpHelp showInView:self.view image:sender.currentBackgroundImage title:strTitle message:strBody animated:YES];
    
    [self.popUpHelp assignScrollingDelegate:self];
    
    self.tableView.scrollEnabled = NO;
}

- (IBAction)helpEatingResponsibly2:(UIButton *)sender
{
    self.popUpHelp.title = @"Comer a Conciencia";
    NSString *strTitle = @"Tener consciencia del consumo de alimentos";
    NSString *strBody = @"Comer pequeños trozos de alimento, masticar pausadamente y no tragar apresuradamente, tomar de 20 -30 minutos para comer y centrar la atención en el plato y las porciones.";
    
    [self.popUpHelp showInView:self.view image:sender.currentBackgroundImage title:strTitle message:strBody animated:YES];
    
    [self.popUpHelp assignScrollingDelegate:self];
    
    self.tableView.scrollEnabled = NO;
}

- (IBAction)helpEatingResponsibly3:(UIButton *)sender
{
    self.popUpHelp.title = @"Tener Horarios";
    NSString *strTitle = @"Establecer horarios de comida";
    NSString *strBody = @"Tener un horario establecido de comidas, evitar el ayuno o saltar tiempos de comida. Designar un lugar y tiempo especifico para ello.";
     
    [self.popUpHelp showInView:self.view image:sender.currentBackgroundImage title:strTitle message:strBody animated:YES];
    [self.popUpHelp assignScrollingDelegate:self];
    
    self.tableView.scrollEnabled = NO;
}

- (void)enableScrolling
{
    self.tableView.scrollEnabled = YES;
}

- (void)showInfoPopUp
{
    [self.popUpHelp showHelpFoodInView:self.view animated:YES];
    [self.popUpHelp assignScrollingDelegate:self];
    self.tableView.scrollEnabled = NO;
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity
              targetContentOffset:(inout CGPoint *)targetContentOffset
{
    [self.popUpHelp placePopUpInY:targetContentOffset->y];
}

- (IBAction)saveFoodValues:(id)sender
{
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *nsManagedObjectContext = [appDelegate managedObjectContext];
    NSEntityDescription *nsEntityDescription =
    [NSEntityDescription entityForName:@"Records" inManagedObjectContext:nsManagedObjectContext];
    
    // A request is created
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    // The entity for the request is specified
    [request setEntity: nsEntityDescription];
    
    NSError *error;
    
    // The request is executed
    NSArray *nsArrayMatchedObject = [nsManagedObjectContext executeFetchRequest: request error:&error];
    
    NSLog(@"Number of recorded dates: %li", nsArrayMatchedObject.count);
    
    NSManagedObject *nsmanagedobjectRecord = [self getRecordInArray:nsArrayMatchedObject];
    
    if (
        nsmanagedobjectRecord
        )
    {
        NSInteger nsintFruitsAndVegetables = self.uisegmentedcontrolFruitsAndVegetables.selectedSegmentIndex;
        NSInteger nsintCereals = self.uisegmentedcontrolCereals.selectedSegmentIndex;
        NSInteger nsintSugars = self.uisegmentedcontrolSugars.selectedSegmentIndex;
        NSInteger nsintFats = self.uisegmentedcontrolFats.selectedSegmentIndex;
        NSInteger nsintCalcium = self.uisegmentedcontrolCalcium.selectedSegmentIndex;
        NSInteger nsintSalts = self.uisegmentedcontrolSalts.selectedSegmentIndex;
        NSInteger nsintWater = self.uisegmentedcontrolWater.selectedSegmentIndex;
        NSInteger nsintEatingResponsibly1 = self.uisegmentedcontrolEatingResponsibly1.selectedSegmentIndex;
        NSInteger nsintEatingResponsibly2 = self.uisegmentedcontrolEatingResponsibly2.selectedSegmentIndex;
        NSInteger nsintEatingResponsibly3 = self.uisegmentedcontrolEatingResponsibly3.selectedSegmentIndex;
        
        [nsmanagedobjectRecord setValue:[NSNumber numberWithInteger:nsintFruitsAndVegetables] forKey:@"fruitsAndVegetables"];
        [nsmanagedobjectRecord setValue:[NSNumber numberWithInteger:nsintCereals] forKey:@"cereals"];
        [nsmanagedobjectRecord setValue:[NSNumber numberWithInteger:nsintSugars] forKey:@"sugars"];
        [nsmanagedobjectRecord setValue:[NSNumber numberWithInteger:nsintFats] forKey:@"fats"];
        [nsmanagedobjectRecord setValue:[NSNumber numberWithInteger:nsintCalcium] forKey:@"calcium"];
        [nsmanagedobjectRecord setValue:[NSNumber numberWithInteger:nsintSalts] forKey:@"salts"];
        [nsmanagedobjectRecord setValue:[NSNumber numberWithInteger:nsintWater] forKey:@"water"];
        [nsmanagedobjectRecord setValue:[NSNumber numberWithInteger:nsintEatingResponsibly1] forKey:@"eatingResponsibly1"];
        [nsmanagedobjectRecord setValue:[NSNumber numberWithInteger:nsintEatingResponsibly2] forKey:@"eatingResponsibly2"];
        [nsmanagedobjectRecord setValue:[NSNumber numberWithInteger:nsintEatingResponsibly3] forKey:@"eatingResponsibly3"];
        
        // Tries to save the context to the database
        NSError *saveError;
        [nsManagedObjectContext save: &saveError];
        
        if (
            saveError == nil
            )
        {
            NSLog(@"Record saved successfully!");
        }
        else
        {
            NSLog(@"Can't save! %@ %@", saveError, [saveError localizedDescription]);
        }
    }
    else
    {
        NSLog(@"Record not found");
    }
}

- (NSManagedObject *)getRecordInArray:(NSArray *)array
{
    NSLog(@"Retrieving record.");
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.timeStyle = NSDateFormatterNoStyle;
    dateFormatter.dateStyle = NSDateFormatterMediumStyle;
    NSDate *nsdateCurrentDate = [NSDate date];
    
    NSManagedObject *nsmanagedobjectSelectedRecord = nil;
    int intNSManagedObject = 0;
    
    /*WHILE-DO*/
    while (
        (intNSManagedObject < array.count) &&
        (nsmanagedobjectSelectedRecord == nil)
        )
    {
        NSManagedObject *nsmanagedobjectDate = array[intNSManagedObject];
        NSDate *nsdateComparisonDate = [nsmanagedobjectDate valueForKey:@"date"];
        
        if (
            [[dateFormatter stringFromDate:nsdateCurrentDate] isEqualToString:[dateFormatter stringFromDate:nsdateComparisonDate]]
            )
        {
            nsmanagedobjectSelectedRecord = nsmanagedobjectDate;
        }
        
        intNSManagedObject = intNSManagedObject + 1;
    }
    
    return nsmanagedobjectSelectedRecord;
}

@end
