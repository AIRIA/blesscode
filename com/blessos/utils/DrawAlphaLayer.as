///////////////////////////////////////////////////////
//
//Author:BlessMan
//QQ:506896470
//E-mail:chaibincheng0305@163.com
//
///////////////////////////////////////////////////////
package com.blessos.utils
{
	
	/**
	 * 在指定的组件内绘制透明的蒙板
	 * 类似在win7 操作系统的桌面 按下鼠标移动后 产生的效果
	 * 此类是一个单例类
	 */
	public class DrawAlphaLayer
	{
		private static var instance:DrawAlphaLayer;
		
		public static function getInstance():DrawAlphaLayer{
			if(!instance){
				instance = new DrawAlphaLayer();
			}
			return instance;
		}
	}
}