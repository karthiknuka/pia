package DSA;

import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.EncodedKeySpec;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;

public class Publickey {
	String pubkey,prikey;
  public void keyGeneration() throws Exception {
    String algorithm = "RSA"; // or RSA, DH, etc.

    // Generate a 1024-bit Digital Signature Algorithm (DSA) key pair
    KeyPairGenerator keyGen = KeyPairGenerator.getInstance(algorithm);
    keyGen.initialize(1024);
    KeyPair keypair = keyGen.genKeyPair();
    PrivateKey privateKey = keypair.getPrivate();
    PublicKey publicKey = keypair.getPublic();

    byte[] privateKeyBytes = privateKey.getEncoded();
    byte[] publicKeyBytes = publicKey.getEncoded();

	System.out.println("publicKey...."+publicKey.toString());
	System.out.println("privateKey...."+privateKey.toString());
	
	setPubkey(publicKey.toString());
	setPrikey(privateKey.toString());

    //KeyFactory keyFactory = KeyFactory.getInstance(algorithm);
    /*EncodedKeySpec privateKeySpec = new PKCS8EncodedKeySpec(privateKeyBytes);
    PrivateKey privateKey2 = keyFactory.generatePrivate(privateKeySpec);

    EncodedKeySpec publicKeySpec = new X509EncodedKeySpec(publicKeyBytes);
    PublicKey publicKey2 = keyFactory.generatePublic(publicKeySpec);

    // The orginal and new keys are the same
    boolean same = privateKey.equals(privateKey2); 
    same = publicKey.equals(publicKey2); 
  */
  }
  public void setPubkey(String pubkey){
	this.pubkey = pubkey;
  }
  public void setPrikey(String prikey){
	this.prikey = prikey;
  }
 public String getPubkey(){
  return pubkey;
  }
 public String getPrikey(){
  return prikey;
  }
}

