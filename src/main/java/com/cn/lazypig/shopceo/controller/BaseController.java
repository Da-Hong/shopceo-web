package com.cn.lazypig.shopceo.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;

@Controller
@RequestMapping("/base")
public class BaseController {
	private static Logger logger = Logger.getLogger(BusinessController.class);

	@RequestMapping("/index")
	public String toIndex() {
		return "index";
	}

//	@RequestMapping("/bipic/{adId}")
//	public void binaryPic(@PathVariable("adId") int adId,
//			HttpServletRequest req, HttpServletResponse rep) {
//		String url = req.getRequestURL().toString();
//		int width = 100;
//		int height = 100;
//		logger.info("Url:" + url);
//		Map<EncodeHintType, String> hints = new HashMap<EncodeHintType, String>();
//		hints.put(EncodeHintType.CHARACTER_SET, "utf-8");
//		try {
//			MultiFormatWriter wr = new MultiFormatWriter();
//			BitMatrix bitMatrix = wr.encode(url, BarcodeFormat.QR_CODE, width,
//					height, hints);
//			MatrixToImageWriter.writeToStream(bitMatrix, "JPEG",
//					rep.getOutputStream());
//		} catch (WriterException e) {
//			e.printStackTrace();
//		}
//		catch (IOException e) {
//			e.printStackTrace();
//		}
//
//	}

}
