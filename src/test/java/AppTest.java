import org.apache.shiro.crypto.RandomNumberGenerator;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;
import org.junit.Test;

public class AppTest {
    public void test1(){
        /*加盐*/
        RandomNumberGenerator randomNumberGenerator =new SecureRandomNumberGenerator();
        ByteSource byteSource =randomNumberGenerator.nextBytes();
        String password = byteSource.toHex();
        System.out.println("randomNumberGenerator = " + randomNumberGenerator);
        System.out.println("byteSource = " + byteSource);
        System.out.println("password = " + password);

        /*加密算法*/
        String algorithmName = "md5";
        int hashIterations = 2;
        String newName = new SimpleHash(algorithmName, "[mima]", ByteSource.Util.bytes("[xingming]"), hashIterations).toHex();
        System.out.println(newName);
    }
}
