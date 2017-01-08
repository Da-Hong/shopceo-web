package com.cn.lazypig.shopceo.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;

/**
 * @Description: 生成二维码 （QR格式）
 * @author lwei
 */
public class BarCode2DServlet extends HttpServlet {

	/**
	 * @Fields serialVersionUID : serialVersionUID
	 */
	private static Logger logger = Logger.getLogger(BarCode2DServlet.class);
	private static final long serialVersionUID = 1L;


	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse rep)
			throws ServletException, IOException {
		String url = req.getRequestURL().toString();
		int width = 100;
		int height = 100;
		logger.info("Url:" + url);
		Map<EncodeHintType, String> hints = new HashMap<EncodeHintType, String>();
		hints.put(EncodeHintType.CHARACTER_SET, "utf-8");
		try {
			MultiFormatWriter wr = new MultiFormatWriter();
			BitMatrix bitMatrix = wr.encode(url, BarcodeFormat.QR_CODE, width,
					height, hints);
			MatrixToImageWriter.writeToStream(bitMatrix, "JPEG",
					rep.getOutputStream());
		} catch (WriterException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.doGet(req, resp);
	}

}