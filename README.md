# SDCollectionView

An example of a paged collectionView.  Each page is composed of variable sized UICollectionViewCells, creating a beautiful and dynamic layout.  This is especially useful when each cell handles complex logic and therefore must map to a full Controller object of its own.  You can pass the DataSource **any number of elements** in your array, and the SDLayoutManager will calculate the appropriate combination of pages to create an aesthetically pleasing layout.

## Model

I want to display a variety of model objects.  In this case, `SDModel` objects:

```
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *modelDescription;
@property (nonatomic, strong) NSString *imageUrl;
```

## Controllers for each cell

I create an `SDBaseCellController` for each model to handle its complex logic.  The array of `SDBaseCellControllers` now acts as the dataSource for my UICollectionView.

The `SDBaseCellController` maps to the SDModel and cell.  The controller handles configurable and touches.

```
@property (weak, nonatomic) id<SDCellControllerDelegate> delegate;
@property (weak, nonatomic) SDBaseCollectionViewCell *cell;
@property (strong, nonatomic) SDModel *model;
@property (strong, nonatomic) UITapGestureRecognizer* singleTapRecognizer;

+ (NSString *)cellReuseIdentifier;
- (void)configureCell:(SDBaseCollectionViewCell *)cell withModel:(NSObject *)model;
- (void)loadImageWithUrlString:(NSString *)imageUrlString;
- (void)didSingleTapCell:(UITapGestureRecognizer *)recognizer;
```

## Example

Here I have 3 different layouts: 
Layout A, Layout B, Layout C.  Each layout is comprised of different cell types, and each cell has its own unique features: complex configuration, controller logic, and touch handlers.  Whether I want to display 3, 20, or 500, SDLayoutManager will display a combination of Layouts to fit the data source.

Since each of these cells handles complex logic, each cell


| Layout        | Cells                     |                 Example     | 
| ------------- | -------------             | ----------------------------|
| Layout A      | MediumCell, 2 Small Cells | <img src='http://i59.tinypic.com/3515p2h.png' alt='missing' />| 
| Layout B      | LargeCell                 | <img src='http://i59.tinypic.com/e5phxe.jpg' alt='missing' />| 
| Layout C      | 4 StackedCells            | <img src='http://i61.tinypic.com/8xpkx2.pn' alt='missing' />| 


Image courtesy of Keattikorn, panuruangjan, Surachai, and PANPOTE at FreeDigitalPhotos.net
