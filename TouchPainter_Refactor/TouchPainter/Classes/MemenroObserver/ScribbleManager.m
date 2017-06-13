//
//  ScribbleManager.m
//  TouchPainter
//
//  Created by LinBq on 2017/6/6.
//  Copyright © 2017年 LinBq. All rights reserved.
//

#import "ScribbleManager.h"
#import "Scribble.h"
#import "OpenScribbleCommand.h"
#import "ScribbleThumbnailViewImageProxy.h"

#define kScribbleDataPath [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/data"]
#define kScribbleThumbnailPath [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/thumbnails"]

@interface ScribbleManager ()

// create & return scribbleDataDir
- (NSString *)scribbleDataPath;
// create & return scribbleThumbnailDir
- (NSString *)scribbleThumbnailPath;
// fileNames in scribbleDataDir
- (NSArray *)scribbleDataPaths;
// fileNames in scribbleThumbnailDir
- (NSArray *)scribbleThumbnailPaths;

@end

@implementation ScribbleManager

- (void)saveScribble:(Scribble *)scribble thumbnail:(UIImage *)image {
    // get a new index for the new scribble data and its thumbnail
    NSInteger newIndex = self.numberOfScribbles + 1;
    
    // use the index as part of the name for each of them
    NSString *scribbleDataName = [NSString stringWithFormat:@"data_%zd", newIndex];
    NSString *scribbleThumbnailName = [NSString stringWithFormat:@"thumbnail_%zd.png", newIndex];
    
    // get a memento from the scribble
    // then save the memento in the file system
    ScribbleMemento *scribbleMemento = scribble.scribbleMemento;
    NSData *mementoData = scribbleMemento.data;
    NSString *mementoPath = [self.scribbleDataPath stringByAppendingPathComponent:scribbleDataName];
    [mementoData writeToFile:mementoPath atomically:YES];
    
    // save the thumbnail directly in
    // the file system
    NSData *imageData = [NSData dataWithData:UIImagePNGRepresentation(image)];
    NSString *imagePath = [self.scribbleThumbnailPath stringByAppendingPathComponent:scribbleThumbnailName];
    [imageData writeToFile:imagePath atomically:YES];
}

- (NSInteger)numberOfScribbles {
    return self.scribbleThumbnailPaths.count;
}

- (Scribble *)scribbleAtIndex:(NSInteger)index {
    Scribble *loadedScribble = nil;
    NSArray *scribbleDataPathArray = self.scribbleDataPaths;
    
    // load scribble data from the path indicated
    // by the index
    NSString *scribblePath = scribbleDataPathArray[index];
    if (scribblePath.length) {
        NSFileManager *fileManager = [NSFileManager defaultManager];
        // !!!:
        NSData *scribbleData = [fileManager contentsAtPath:[kScribbleDataPath stringByAppendingPathComponent:scribblePath]];
        ScribbleMemento *scribbleMemento = [ScribbleMemento mementoWithData:scribbleData];
        loadedScribble = [Scribble scribbleWithMemento:scribbleMemento];
    }
    
    return loadedScribble;
}

- (UIView *)scribbleThumbnailViewAtIndex:(NSInteger)index {
    ScribbleThumbnailViewImageProxy *loadedScribbleThumbnail = nil;
    NSArray *scribbleThumbnailPathsArray = self.scribbleThumbnailPaths;
    NSArray *scribblePathsArray = self.scribbleDataPaths;
    
    // load scribble thumbnail from the path indicated
    // by the index
    NSString *scribbleThumbnailPath = scribbleThumbnailPathsArray[index];
    NSString *scribblePath = scribblePathsArray[index];
    
    if (scribbleThumbnailPath) {
        // initialize an instance of ScribbleThumbnailProxy
        // with the exact location of the thumbnail in the file system
        loadedScribbleThumbnail = [[ScribbleThumbnailViewImageProxy alloc] init];
        loadedScribbleThumbnail.imagePath = [kScribbleThumbnailPath stringByAppendingPathComponent:scribbleThumbnailPath];
        loadedScribbleThumbnail.scribblePath = [kScribbleDataPath stringByAppendingPathComponent:scribblePath];
        
        // assign a touch command to the scribble thumbnail
        // so it can be used to open a scribble by touch
        OpenScribbleCommand *touchCommand = [[OpenScribbleCommand alloc] initWithScribbleSource:loadedScribbleThumbnail];
        loadedScribbleThumbnail.touchCommand = touchCommand;
    }
    return loadedScribbleThumbnail;
}

#pragma mark -
#pragma mark Private Methods

- (NSString *)scribbleDataPath {
    // lazy create the scribble data directory
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:kScribbleDataPath]) {
        [fileManager createDirectoryAtPath:kScribbleDataPath withIntermediateDirectories:YES attributes:nil error:NULL];
    }
    
    return kScribbleDataPath;
}

- (NSString *)scribbleThumbnailPath {
    // lazy create the scribble data directory
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:kScribbleThumbnailPath]) {
        [fileManager createDirectoryAtPath:kScribbleThumbnailPath withIntermediateDirectories:YES attributes:nil error:NULL];
    }
    
    return kScribbleThumbnailPath;
}

- (NSArray *)scribbleDataPaths {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSArray *scribbleDataPathsArray = [fileManager contentsOfDirectoryAtPath:self.scribbleDataPath error:&error];
    
    return scribbleDataPathsArray;
}

- (NSArray *)scribbleThumbnailPaths {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSArray *scribbleThumbnailPathsArray = [fileManager contentsOfDirectoryAtPath:self.scribbleThumbnailPath error:&error];
    
    return scribbleThumbnailPathsArray;
}

@end
