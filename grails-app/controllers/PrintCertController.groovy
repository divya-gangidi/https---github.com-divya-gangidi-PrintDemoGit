/**
 * Created by dgangigi on 11/13/2015.
 */

import Notice

class PrintCertController {

    def pdfRenderingService

    def index(){
        redirect(action :"noticeList")
    }

    def noticeList(){
        def notices = getNoticesList()
        render (view : "noticeList" ,model:[notices:notices])
    }

    def printCertificate(){
        def noticeNum=params.id
        def notices=getNoticesList()

        def noticeInstance=notices.find() { it ->
            if(it.noticeNum==noticeNum)
                return it
        }
        //render (view : "certificate" ,model:[notice:noticeInstance,printAll:false])
        def args = [template:"certificate", model:[notice:noticeInstance]]
        pdfRenderingService.render(args+[controller:this],response)
    }

    def getNoticesList(){
        def notices =[ new Notice(noticeNum:"123456",title:"Notice 1",address:"413 N state St",certAvailable:true),
                       new Notice(noticeNum:"234567",title:"Notice 2",address:"411 N state",certAvailable:false),
                       new Notice(noticeNum:"345678",title:"Notice 3",address:"412 N state",certAvailable:true)]
        return notices
    }

    def printAllCertificates(){
        def notices = getNoticesList()
        render (view : "certificate" ,model:[notices:notices,printAll:true])
    }
}
