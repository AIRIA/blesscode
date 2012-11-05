import flash.display.DisplayObject;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.geom.Point;

import mx.controls.Alert;

private var clickPoint:Point;//保存鼠标点击桌面时候的坐标

public function initApp(event:Event=null):void{
	deskIconLayerInit();
}

/** 
 * 为桌面图标层添加
 */
public function deskIconLayerInit():void{
	//在鼠标按下的时候 注册mouseMove事件 
	this.addEventListener(MouseEvent.MOUSE_DOWN,startDrawHandler,true);
	this.addEventListener(MouseEvent.MOUSE_UP,endDrawHandler,true);
}
protected function startDrawHandler(event:MouseEvent):void{
	if(!clickPoint){
		clickPoint = new Point();
	}
	clickPoint.x = event.stageX;
	clickPoint.y = event.stageY;
	//在鼠标移动的时候 进行蒙板的绘制
	this.addEventListener(MouseEvent.MOUSE_MOVE,drawHandler,true);
}
protected function drawHandler(event:MouseEvent):void{
	var rectX:Number = Math.min(clickPoint.x,event.stageX);
	var rectY:Number = Math.min(clickPoint.y,event.stageY);
	var rectWidth:Number = Math.abs(clickPoint.x - event.stageX);
	var rectHeight:Number = Math.abs(clickPoint.y - event.stageY);
	deskIconLayer.graphics.clear();
	deskIconLayer.graphics.lineStyle(1,0x0080FF,1);
	deskIconLayer.graphics.beginFill(0x9BB3CD,0.6);
	deskIconLayer.graphics.drawRect(rectX,rectY,rectWidth,rectHeight);
	deskIconLayer.graphics.endFill();
}

protected function endDrawHandler(event:MouseEvent):void
{
	deskIconLayer.graphics.clear();
	this.removeEventListener(MouseEvent.MOUSE_MOVE,drawHandler,true);
}

//---------------------------------------------------------------------
