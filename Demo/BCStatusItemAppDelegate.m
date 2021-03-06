//
//  BCStatusItemAppDelegate.m
//  BCStatusItem
//
//  Created by Jeremy Knope on 3/22/10.
//  Copyright 2010 Buttered Cat Software. All rights reserved.
//

#import "BCStatusItemAppDelegate.h"
#import "NSStatusItem+BCStatusItem.h"
#import "BCStatusItemView.h"

@implementation BCStatusItemAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	NSImage *image = [NSImage imageNamed:@"status"];
	NSImage *alternateImage = [NSImage imageNamed:@"status-selected"];
	statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
	
	[statusItem setupView];
	
	[statusItem setTitle:@"Test"];
	[statusItem setMenu:statusMenu];
	[statusItem setHighlightMode:YES];
	
	[statusItem setImage:image];
	[statusItem setAlternateImage:alternateImage];
	
	[statusItem setViewDelegate:self];
	[[statusItem view] registerForDraggedTypes:[NSArray arrayWithObjects:NSFilenamesPboardType, nil]];
}

- (NSDragOperation)statusItemView:(BCStatusItemView *)view draggingEntered:(id <NSDraggingInfo>)info
{
	NSLog(@"Drag entered!");
	return NSDragOperationCopy;
}

- (void)statusItemView:(BCStatusItemView *)view draggingExited:(id <NSDraggingInfo>)info
{
	NSLog(@"Dragging exit");
}

- (BOOL)statusItemView:(BCStatusItemView *)view prepareForDragOperation:(id <NSDraggingInfo>)info
{
	NSLog(@"Prepare for drag");
	return YES;
}

- (BOOL)statusItemView:(BCStatusItemView *)view performDragOperation:(id <NSDraggingInfo>)info
{
	NSLog(@"Perform drag");
	return YES;
}

@end
