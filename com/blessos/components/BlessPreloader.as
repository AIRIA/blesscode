//////////////////////////////////////////////
//
//BlessFramework
//Copyright 2012 
//Author:BlessMan QQ:506896470 
//E-mail:chaibingcheng0305@163.com
//
//////////////////////////////////////////////
package com.blessos.components
{
	import com.blessos.MyLoader;

	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.net.URLRequest;

	import mx.events.RSLEvent;
	import mx.preloaders.SparkDownloadProgressBar;

	/**
	 *	自定义的Preloader 继承自 SparkDownloadProgressBar
	 * 	initialize()是加载的开始 在此方法中可以获取到stage的大小  我们可以在此方法中添加和stage的属性 有关联的方法
	 *  此方法的调用顺序是progressHandler-->setDownloadProgress-->initProgressHandler
	 *
	 */
	public class BlessPreloader extends SparkDownloadProgressBar
	{

		private var loader:Loader;
		private var themeReq:URLRequest;
		private var bgSprite:Sprite;
		private var loaderMc:MyLoader; //自定义的loader界面 从swc文件中

		public function BlessPreloader()
		{
			super();
			loader=new Loader();
			loaderMc=new MyLoader();
			loaderMc.loadingLabel.text="我们正在努力为您加载...";
		}

		/**
		 * 加载RSL的计数方法;
		 * @param event
		 *
		 */
		protected override function initProgressHandler(event:Event):void
		{
		}

		public override function initialize():void
		{
			createChildren();
		}

		protected override function setInitProgress(completed:Number, total:Number):void
		{
		}

		protected override function rslProgressHandler(event:RSLEvent):void
		{
			loaderMc.loadingLabel.text="" + event.rslIndex + "/" + event.rslTotal;
		}

		protected override function createChildren():void
		{
			//覆盖父类的方法
			drawBg();
			addChild(loaderMc);
			loaderMc.width=430;
			loaderMc.height=250;
			loaderMc.x=stage.stageWidth - loaderMc.width >> 1;
			loaderMc.y=stage.stageHeight - loaderMc.height >> 1;
		}

		protected override function progressHandler(event:ProgressEvent):void
		{
			//此处并没有覆盖父类的方法 只是为了更好的理解flex SparkDownloadProgressBar是如何工作的
			super.progressHandler(event);
			setDownloadProgress(event.bytesLoaded, event.bytesTotal);
		}

		/**
		 * flex源码中progressHandler会调用setDownloadeProgress方法来更新加载进度
		 * 可以把自己想要的逻辑放到此方法中 来实现自定义
		 * @param completed
		 * @param total
		 *
		 */
		protected override function setDownloadProgress(completed:Number, total:Number):void
		{
			loaderMc.percentLabel.text=Math.ceil(completed / total * 100) + "%";
		}

//--------------------------------------------------------------------------------
		/**
		 * 绘制背景颜色
		 */
		private function drawBg():void
		{
			bgSprite=new Sprite();
			bgSprite.graphics.beginFill(0x33B2F5, 0.6);
			bgSprite.graphics.drawRect(0, 0, stage.stageWidth, stage.stageHeight);
			bgSprite.graphics.endFill();
			addChild(bgSprite);
		}

	}
}
