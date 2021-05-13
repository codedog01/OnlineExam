// $(function(){
// 	let mediaStreamTrack=null;
// 	openMedia();
// 	setTimeout("tishi()","1000");
// 	setTimeout("takePhoto()","5000");
//
// })
var number=0;

    function openMedia() {
        let constraints = {
            video: { width: 300, height: 300 },
            audio: false
        };
        // 获得video摄像头
        let video = document.getElementById('video');
        let promise = navigator.mediaDevices.getUserMedia(constraints);
        promise.then((mediaStream) => {
            mediaStreamTrack = typeof mediaStream.stop === 'function' ? mediaStream : mediaStream.getTracks()[1];
            video.srcObject = mediaStream;
            video.play();
        });

        // navigator.mediaDevices.getUserMedia()
        //     .then(function(mediaStream) {
        //         var video = document.querySelector('video');
        //         video.srcObject = mediaStream;
        //         video.onloadedmetadata = function(e) {
        //             video.play();
        //         };
        //     })
        //     .catch(function(err) {
        //         console.log(err.name + ": " + err.message);
        //     }); // always check for errors at the end.
    }

    // 拍照
    function takePhoto() {
        //获得Canvas对象
        let video = document.getElementById('video');
        let canvas = document.getElementById('canvas');
        let ctx = canvas.getContext('2d');
        ctx.drawImage(video, 0, 0, 300, 200);
		// toDataURL  ---  可传入'image/png'---默认, 'image/jpeg'
        let img = document.getElementById('canvas').toDataURL();
         userName=document.getElementById("currentUserName").innerText
        // 这里的img就是得到的图片
        // console.log('img-----', img);
        console.log(userName);
        document.getElementById('imgTag').src=img;

        $.ajax({
            url:"/login/searchface",    //请求的url地址
            dataType:"json",   //返回格式为json
            async:true,//请求是否异步，默认为异步，这也是ajax重要特性
            // contentType:"application/json",
            data: {
                "imagebast64": img,
                "userName":userName,
            } , //参数值
            type: "POST", //请求方式
            success: function (data) {
                if(data=="fail"||data.score.substr(0,2)<80){
                    number++;
                    $("#flag").html("检测到为非本人，警告第"+number+"次，2次后将自动提交试卷");
                    if(number<3){
                        setTimeout("takePhoto()","3000");
                    }else {
                        $("#flag").html("多次检测到为非本人，自动提交试卷中");
                        examDetailPage.finishExamAction()
                    }
                }
                if(data.score.substr(0,2)>90) {
                    $("#flag").html("认证成功，请保持现状");
                }
            }
            })

    }

    // 关闭摄像头
    function closeMedia() {
        mediaStreamTrack.stop();
    }