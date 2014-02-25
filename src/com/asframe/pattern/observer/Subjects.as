/**
 * @Subjects.as
 * 
 * @author sodaChen mail:asframe#163.com
 * @version 1.0
 * <br>Copyright (C), 2010 asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:AStruts2
 * <br>Date:2012-4-7
 */
package com.asframe.pattern.observer
{
	import com.asframe.collections.maps.HashMap;
	import com.asframe.collections.maps.IMap;

	/**
	 * 多主题处理对象
	 * @author sodaChen
	 * Date:2012-4-7
	 */
	public class Subjects implements ISubjects
	{
		/** 主题集合 **/
		protected var subjectMap			:IMap;
		/** 生成一个新的主题的Class对象 **/
		protected var subjectClass			:Class;
		
		public function Subjects(subjectClass:Class = null)
		{
			subjectMap = new HashMap();
			setSubjectClass(subjectClass);
		}
		public function addObserver(notice:*,observer:IObserver):void
		{
			var subject:ISubject = subjectMap.get(notice);
			if(subject == null)
			{
				subject = new subjectClass();
				subjectMap.put(notice,subject);
			}
			subject.addObserver(observer);
		}
		public function removeObserver(notice:*,observer:IObserver):void
		{
			var subject:ISubject = subjectMap.get(notice);
			if(subject != null)
			{
				subject.removeObserver(observer);
			}
		}
		/**
		 * 设置生成一个新的主题的Class对象 
		 * @param subjectClass
		 * 
		 */		
		public function setSubjectClass(subjectClass:Class):void
		{
			if(subjectClass == null)
			{
				subjectClass = Subject;
			}
			this.subjectClass = subjectClass;
		}
		/**
		 * 发送一个通知 
		 * @param notice 通知对象
		 * @param args 不定参数
		 * 
		 */		
		public function sendNotice(notice:*,...args):void
		{
			sendNoticeArg(notice,args);
		}
		/**
		 * 发送一个通知，参数是一个数组 
		 * @param notice 通知主题
		 * @param args 参数数组
		 * 
		 */		
		public function sendNoticeArg(notice:*,args:Array = null):void
		{
			var subject:ISubject = subjectMap.get(notice);
			if(subject == null)
			{
				throw new NoticeError("发送的通知找不到对应的主题  notice:" + notice + " 类型:" + typeof(notice));
			}
			args.unshift(notice);
			subject.sendNotice.apply(subject,args);
		}
	}
}
